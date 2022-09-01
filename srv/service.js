const cds = require('@sap/cds');

let authorIDmax=-1;
let readerIDmax=-1;
let bookIDmax=-1;
let bookingIDmax=-1;

module.exports = cds.service.impl(async function () {

    let { Books, Readers, Authors, Booking } = this.entities;

    this.before('SAVE', 'Authors', async (req)=>{
        const authors = await SELECT.from(Authors);
        if(authors.length) {
            authorIDmax = Math.max(...authors.map(el=>el.authorID))
        };
        req.data.authorID = authorIDmax+1;
        authorIDmax++;
    })

    this.before('SAVE', 'Readers', async (req)=>{
        const readers = await SELECT.from(Readers);
        if(readers.length) {
            readerIDmax = Math.max(...readers.map(el=>el.readerID))
        };
        req.data.readerID = readerIDmax+1;
        readerIDmax++;
    })

    this.before('SAVE', 'Books', async (req)=>{
        const books = await SELECT.from(Books);
        if(books.length) {
            bookIDmax = Math.max(...books.map(el=>el.bookID))
        };
        req.data.bookID = bookIDmax+1;
        bookIDmax++;
    })

    this.before('SAVE', 'Booking', async (req)=>{
        const bookings = await SELECT.from(Booking);
        if(bookings.length) {
            bookingIDmax = Math.max(...bookings.map(el=>el.bookingID))
        };
        req.data.bookingID = bookingIDmax+1;
        bookingIDmax++;
    })

   })