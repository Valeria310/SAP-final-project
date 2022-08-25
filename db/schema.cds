namespace kb.library;

using { cuid, managed, Currency } from '@sap/cds/common';

entity Authors: cuid, managed {
    authorID: Integer;
    firstName: String;
    lastName: String;
    birthday: Date;
    country: String;
    image: String;
    books: Association to many Books on books.toAuthor = $self;
}

entity Booking: cuid, managed {
    bookingID: Integer;
    readerID: Association to Readers; 
    bookID: Association to Books;
    bookingStatus:Association to Statuses;
    beginDate: Date;
    beginTime: Integer;
    endDate: Date;
    endTime: Integer;
    image: String;
    returnTheBookEnabled: Boolean;
}

entity Books: cuid, managed {
    toAuthor: Association to Authors;
    bookID: Integer;
    bookName: String;
    pageNumber: Integer;
    copyQty: Integer;
    shippedQty: Integer;
    price: Double;
    CurrencyCode: Currency;
    status: Association to BookStatuses;
    image: String;
    orderBookEnabled: Boolean;
}

entity Readers: cuid, managed {
    readerID: Integer;
    firstName: String;
    lastName: String;
    readerBirthday: Date;
    phonenumber: String;
    image: String;
}

entity Statuses {
    ID: Integer;
    name: String;
    criticality: Integer;
}

entity BookStatuses {
    ID: Integer;
    name: String;
    criticality: Integer;
}