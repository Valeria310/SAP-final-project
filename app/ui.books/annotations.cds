using LibraryService as service from '../../srv/service';

annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'author ID',
            Value : toAuthor_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book ID',
            Value : bookID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book name',
            Value : bookName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'page number',
            Value : pageNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'copy quantity',
            Value : copyQty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'shipped quantity',
            Value : shippedQty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency',
            Value : CurrencyCode_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status_ID,
        },
    ]
);
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'author ID',
                Value : toAuthor_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'book name',
                Value : bookName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'page number',
                Value : pageNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'copy quantity',
                Value : copyQty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'shipped quantity',
                Value : shippedQty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency code',
                Value : CurrencyCode_code,
            },
            {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status_ID,
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

annotate service.Books with @odata.draft.enabled;
