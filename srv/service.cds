using {db} from '../db/schema';

service BookstoreService {
    entity Books      as projection on db.Books
        actions {
            action addstock();
            action changePublishDate(newDate: Date);
            action changeStatus( @(Common: {
                                     ValueListWithValues: true,
                                     Label              : 'New status',
                                     ValueList          : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'BookStatus',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocakDateProperty: newStatus,
                                             ValueListProperty: 'code',
                                         }, ],
                                     },
                                 })
                                 newStatus: String)
        };

    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenersVH   as projection on db.genres;

}

annotate BookstoreService.Books with @odata.draft.enabled;
