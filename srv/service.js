const cds = require('@sap/cds');
// const uuid = require('uuid')

let authorIDmax=-1;
let readerIDmax=-1;
let bookIDmax=-1;
let bookingIDmax=-1;

module.exports = cds.service.impl(async function () {

    let { Books, Readers, Authors, Booking } = this.entities;

    this.before('CREATE', 'Authors', async (req)=>{
        const authors = await SELECT.from(Authors);
        if(authors.length) {
            authorIDmax = Math.max(...authors.map(el=>el.authorID))
        };
        req.data.authorID = authorIDmax+1;
        authorIDmax++;
    })

    this.before('CREATE', 'Readers', async (req)=>{
        const readers = await SELECT.from(Readers);
        if(readers.length) {
            readerIDmax = Math.max(...readers.map(el=>el.readerID))
        };
        req.data.readerID = readerIDmax+1;
        readerIDmax++;
    })

    this.before('CREATE', 'Books', async (req)=>{
        const books = await SELECT.from(Books);
        if(books.length) {
            bookIDmax = Math.max(...books.map(el=>el.bookID))
        };
        req.data.bookID = bookIDmax+1;
        bookIDmax++;
    })

    this.before('CREATE', 'Booking', async (req)=>{
        const bookings = await SELECT.from(Booking);

        if(bookings.length) {
            bookingIDmax = Math.max(...bookings.map(el=>el.bookingID))
        };

        req.data.bookingID = bookingIDmax+1;
        req.data.bookingStatus_ID = 1;
        req.data.beginDate = (new Date()).toISOString();
        req.data.beginTime = (new Date()).toUTCString();

        bookingIDmax++;
    })

    this.on('orderBook', 'Books', async(req) => {
        const bookings = await SELECT.from(Booking);
        if(bookings.length) {
            bookingIDmax = Math.max(...bookings.map(el=>el.bookingID))
        };
            
        await INSERT ({bookingID:bookingIDmax+1, bookID_ID: req.params[0].ID, bookingStatus_ID: 1, beginDate: (new Date()).toISOString(), beginTime: (new Date()).toUTCString(), quantity: req.data.Quantity}) .into(Booking);
        
        // await UPDATE `Books` .set `status_ID = 1` .where `ID = ${req.params[0].ID}`
        // await UPDATE (Books, {ID: req.params[0].ID}) .with({status_ID: 1})

        bookingIDmax++;
            
    })

    this.on('returnTheBook', 'Booking', async(req) => {
        if(req.data.Answer) {
            await UPDATE (Booking, {ID: req.params[0].ID}) .with({endDate: (new Date()).toISOString(), endTime: (new Date()).toUTCString()})
        }
    })
        
})
