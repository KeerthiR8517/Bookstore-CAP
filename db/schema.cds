using {
    cuid,
    managed
} from '@sap/cds/common';

namespace db;

entity Books : cuid, managed {
    title    : String;
    author   : Association to Authors; // managed Association
    chapters : Composition of many Chapters
                   on chapters.book = $self; //composition

}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self; // unmanaged Association

}

entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
}
