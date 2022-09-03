using kb.library as my from '../db/schema';

service LibraryService {

    entity Authors as projection on my.Authors;
    entity Booking as projection on my.Booking actions {
        action returnTheBook(Answer: Boolean @title : 'Do you really want to return the books?')
    };
    entity Books as projection on my.Books actions {
        action orderBook(Quantity: Integer @title : 'Enter the number of books to order')
    };
    entity Readers as projection on my.Readers;
    entity Statuses as projection on my.Statuses;
    entity BookStatuses as projection on my.BookStatuses;

}