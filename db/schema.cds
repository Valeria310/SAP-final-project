namespace kb.library;

using { cuid, managed, Currency } from '@sap/cds/common';

entity Authors: managed {
    key ID: UUID;
    authorID: Integer;
    firstName: String;
    lastName: String;
    birthday: Date;
    country: String;
    image: LargeBinary @Core.MediaType : 'image/png';
    books: Association to many Books on books.toAuthor = $self;
}

entity Booking: managed {
    key ID: UUID;
    bookingID: Integer;
    readerID: Association to Readers; 
    bookID: Association to Books;
    bookingStatus: Association to one Statuses ;
    beginDate: Date;
    beginTime: Time;
    endDate: Date;
    endTime: Time;
    image: LargeBinary @Core.MediaType : 'image/png';
    virtual returnTheBookEnabled: Boolean;
}

entity Books: managed {
    key ID: UUID;
    bookID: Integer;
    toAuthor: Association to Authors;
    bookName: String;
    pageNumber: Integer;
    copyQty: Integer;
    shippedQty: Integer;
    price: Double;
    CurrencyCode: Currency;
    status: Association to BookStatuses;
    image: LargeBinary @Core.MediaType : 'image/png';
    virtual orderBookEnabled: Boolean;
}

entity Readers: managed {
    key ID: UUID;
    readerID: Integer;
    firstName: String;
    lastName: String;
    readerBirthday: Date;
    phonenumber: String;
    image: LargeBinary @Core.MediaType : 'image/png';
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