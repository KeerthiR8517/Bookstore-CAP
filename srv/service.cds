using {db} from '../db/schema';

service BookstoreService {
    entity Books      as projection on db.Books;
    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenersVH as projection on db.genres;

}
annotate BookstoreService.Books with @odata.draft.enabled;
