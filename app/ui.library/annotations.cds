using LibraryService as service from '../../srv/service';

annotate service.Booking with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'booking ID',
            Value : bookingID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'reader',
            Value : readerID.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book',
            Value : bookID.bookName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : bookingStatus.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'begin date',
            Value : beginDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'end date',
            Value : endDate,
        },
    ]
);
annotate service.Booking with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            $Type : 'UI.DataField',
            Label : 'reader',
            Value : readerID_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book',
            Value : bookID_ID,
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

annotate LibraryService.Authors with {
    ID @(
        UI.Hidden,
        Common : {
            Label : 'Last Name',
            Text  : lastName
        }
    );
}

annotate service.Booking with @odata.draft.enabled;
annotate service.Booking with {
    readerID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Readers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : readerID_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'lastName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Booking with {
    bookID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Books',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bookID_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'bookName',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
