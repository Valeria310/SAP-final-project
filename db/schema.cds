namespace kb.library;

using { cuid, managed, Currency } from '@sap/cds/common';

entity Authors: cuid, managed {
    key authorID: Integer;
    firstName: String;
    lastName: String;
    birthday: Date;
    country: String;
    image: String;
    books: Association to many Books on books.toAuthor = $self;
}

entity Booking: cuid, managed {
    key bookingID: Integer;
    readerID: Association to Readers; 
    bookID: Association to Books;
    bookingStatus:Association to Statuses;
    beginDate: Date;
    beginTime: Time;
    endDate: Date;
    endTime: Time;
    image: String;
    returnTheBookEnabled: Boolean;
}

entity Books: cuid, managed {
    key bookID: Integer;
    toAuthor: Association to Authors;
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
    key readerID: Integer;
    firstName: String;
    lastName: String;
    readerBirthday: Date;
    phonenumber: String;
    image: String;
}

entity Statuses {
    key ID: Integer;
    name: String;
    criticality: Integer;
}

entity BookStatuses {
    key ID: Integer;
    name: String;
    criticality: Integer;
}