const cds = require('@sap/cds');
const constants = require('./constants');


module.exports = cds.service.impl(async function () {

    let { Books, Readers, Authors, Booking } = this.entities;

    this.before('NEW', 'Authors', async (req)=>{
        const { maxID } = await SELECT.one`max(authorID) as maxID`.from(Authors);
        req.data.authorID = maxID + 1;
    })

    this.before('NEW', 'Readers', async (req)=>{
        const { maxID } = await SELECT.one`max(readerID) as maxID`.from(Readers);
        req.data.readerID = maxID + 1;
    })

    this.after('READ', 'Books', (each)=>{
        console.log(each)
        if(each.copyQty > 1) {
            each.orderBookEnabled = true;
        }
    })

    this.before('NEW', 'Books', async (req)=>{
        const { maxID } = await SELECT.one`max(bookID) as maxID`.from(Books);
        req.data.bookID = maxID + 1;
        req.data.status_ID = 0;
    })

    this.before('CREATE', 'Books', async (req)=>{
        const book = req.data;
        if(book.pageNumber<=0) {
            return req.error(400, constants.wrongPagesInput);
        }
        if(book.copyQty<=0) {
            return req.error(400, constants.wrongCopiesInput);
        }
    })

    this.before('NEW', 'Booking', async (req)=>{
        const { maxID } = await SELECT.one`max(bookingID) as maxID`.from(Booking);
        req.data.bookingID = maxID + 1;
        
    })

    this.after('READ', 'Booking', (each)=>{
        if(each.bookingStatus_ID == 1) {
            each.returnTheBookEnabled = true;
        }
    })

    this.before('CREATE', 'Booking', async (req)=>{
        req.data.beginDate = (new Date()).toISOString();
        req.data.beginTime = (new Date()).toUTCString();
        req.data.bookingStatus_ID = 1;
    })

    this.before('SAVE', 'Booking', async (req)=>{
        const {bookID_ID} = req.data;
        let {copiesBook} = await SELECT.one`copyQty as copiesBook`.from(Books).where({ID:bookID_ID});
        let {takenBooks} = await SELECT.one`count(bookingStatus_ID) as takenBooks`.from(Booking).where({bookID_ID:bookID_ID, bookingStatus_ID: 1});
        if(copiesBook<=takenBooks) {
            return req.error(400,constants.bookNotAvailable);
        }
    })

    this.on('orderBook', 'Books', async(req) => {
        const { maxID } = await SELECT.one`max(bookingID) as maxID`.from(Booking);            
        return INSERT ({bookingID:maxID+1, bookID_ID: req.params[0].ID, bookingStatus_ID: 1, beginDate: (new Date()).toISOString(), beginTime: (new Date()).toUTCString()}) .into(Booking);
    })

    this.on('returnTheBook', 'Booking', async(req) => {
        if(req.data.Answer) {
            return UPDATE (Booking, {ID: req.params[0].ID}) .with({bookingStatus_ID: 2, endDate: (new Date()).toISOString(), endTime: (new Date()).toUTCString()})
        }
    })
        
})
