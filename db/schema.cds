using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';

namespace db;

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors; // managed Association
    genre       : Association to genres;
    publishedAt : Date;
    pages       : Integer;
    currency    : Association to Currencies; //value help from sap.common. currencies
    price       : Decimal(9, 2);
    stock       : Integer;
    status      : Association to BookStatus;
    chapters    : Composition of many Chapters
                      on chapters.book = $self; //composition

}

entity genres { //custum drop-down
    key code        : Genre;
        description : String;

}

type Genre : String enum {
    FIC = 'Fiction';
    NFI = 'Non-Fiction';
    SCI = 'Science';
    TEC = 'Technology';
    HIS = 'History';
    BIO = 'Biography';
    ROM = 'Romance';
    THR = 'Thriller';
    MYS = 'Mystery';
    FAN = 'Fantasy';
}


entity BookStatus { //criticality
    key code        : String(1) enum {
            Available = 'A';
            Low_status = 'L';
            Unavailable = 'U';
        }
        criticality : Integer;
        displayText : String;

}


// type BookStatus : String(1) enum {
//     Available ='A';
//     Low_status='L';
//     Unavailable='U';
// }

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self; // unmanaged Association

}

entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
        title  : String;
        pages  : Integer;
}
