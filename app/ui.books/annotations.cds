using LibraryService as service from '../../srv/service';

annotate service.Books with @(
    UI.SelectionFields: [price],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Author',
            Value : toAuthor.lastName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Book ID',
            Value : bookID,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Book name',
            Value : bookName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Page number',
            Value : pageNumber,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Copy quantity',
            Value : copyQty,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Shipped quantity',
            Value : shippedQty,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : CurrencyCode.code,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status.name,
            Criticality: status.criticality,
            ![@UI.Importance]: #High,
        },
    ],
    UI.Identification: [
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'LibraryService.orderBook',
            Label: 'Order Book'
        }
    ],
    UI.PresentationVariant: {SortOrder: [{
        $Type: 'Common.SortOrderType',
        Property: bookName,
        Descending: false
    }]},
    UI.HeaderInfo: {
        TypeName: 'Book',
        TypeNamePlural: 'Books',
        Title: {Value: bookName}
    },
    UI.HeaderFacets: [{
        $Type: 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Description',
        ![@UI.Importance]: #High
    }],
    UI.FieldGroup #Description: {
        Data: [
            {
                $Type: 'UI.DataField',
                Value: image
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name of the book',
                Value: bookName
            },
            {
                $Type: 'UI.DataField',
                Label: `Author's name`,
                Value: toAuthor.firstName
            },
            {
                $Type: 'UI.DataField',
                Label: `Author's surname`,
                Value: toAuthor.lastName
            },
        ]
    },
    UI.FieldGroup #Details: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Book ID',
                Value: bookID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Author ID',
                Value: toAuthor_ID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name of the book',
                Value: bookName
            },
            {
                $Type: 'UI.DataField',
                Label: 'Page number',
                Value: pageNumber
            },
            {
                $Type: 'UI.DataField',
                Label: 'Copy quantity',
                Value: copyQty
            },
            {
                $Type: 'UI.DataField',
                Label: 'Shipped quantity',
                Value: shippedQty
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: price
            },
            {
                $Type: 'UI.DataField',
                Label: 'Currency code',
                Value: CurrencyCode_code
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value: status.name,
                Criticality: status.criticality
            },
        ]
    },
    UI.FieldGroup #AdministrativeData: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Create by',
                Value: createdBy
            },
            {
                $Type: 'UI.DataField',
                Label: 'Create at',
                Value: createdAt
            },
            {
                $Type: 'UI.DataField',
                Label: 'Update by',
                Value: modifiedBy
            },
            {
                $Type: 'UI.DataField',
                Label: 'Update at',
                Value: modifiedAt
            },
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.CollectionFacet',
            ID: 'PODetails',
            Label: 'General information',
            Facets: [{
                $Type: 'UI.ReferenceFacet',
                Label: 'General information',
                Target: '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type: 'UI.CollectionFacet',
            ID: 'POAdmininfo',
            Label: 'Administrative information',
            Facets: [{
                $Type: 'UI.ReferenceFacet',
                Label: 'Administrative information',
                Target: '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ],
    Capabilities.Deletable: true,
    Capabilities.Insertable: true
);

annotate service.Books with {
    bookID @readonly;
    bookName @mandatory;
    toAuthor @mandatory;
    pageNumber @mandatory;
    copyQty @mandatory;
    price @mandatory;
    CurrencyCode @mandatory;
    status @readonly;
};

annotate service.Books with @odata.draft.enabled;

annotate service.Books with {
    toAuthor @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Authors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : toAuthor_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'lastName',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Books with {
    CurrencyCode @Common.ValueListWithFixedValues : true
};