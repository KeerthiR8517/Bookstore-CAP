using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PublishedAt',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entry Info',
            ID : 'AdministrationInfo',
            Target : '@UI.FieldGroup#AdministrationInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookName}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PublishedAt',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    UI.SelectionFields : [
        price,
    ],
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeImageUrl : 'sap-icon://course-book',
        Description : {
            $Type : 'UI.DataField',
            Value : genre,
        },
    },
    UI.FieldGroup #AdministrationInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label : 'Price'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.chapters.title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : book.chapters.pages,
            Label : 'pages',
        },
        {
            $Type : 'UI.DataField',
            Value : book.chapters.number,
            Label : 'number',
        },
    ]
);

