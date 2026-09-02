using {db} from '../db/schema';

service BookstoreService {
    entity Books      as projection on db.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addstock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetProperties: ['in']})
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
         @(Common.SideEffects: {TargetEntities: ['/BookstoreService.EntityContainer/Books']})
       action addDiscount();

    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenersVH   as projection on db.genres;

}

annotate BookstoreService.Books with @odata.draft.enabled;
annotate BookstoreService.Authors with @odata.draft.enabled;
