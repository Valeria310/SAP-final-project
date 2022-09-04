using LibraryService as service from '../../srv/service';

annotate service.Booking with @(
    UI.SelectionFields: [bookingStatus_ID],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'booking ID',
            Value : bookingID,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'reader',
            Value : readerID.lastName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book',
            Value : bookID.bookName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : bookingStatus.name,
            Criticality: bookingStatus.criticality,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'begin date',
            Value : beginDate,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'begin time',
            Value : beginTime,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'end date',
            Value : endDate,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'end time',
            Value : endTime,
            ![@UI.Importance]: #High,
        },
    ],
    UI.Identification: [
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'LibraryService.returnTheBook',
            Label: 'Return the book',
        }
    ],
    PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : bookingID,
            Descending : false
    }]},
    UI.HeaderInfo: {
        TypeName: 'Booking',
        TypeNamePlural: 'Bookings',
        Title: {Value:bookingStatus.name},
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
                Label: 'Booking status',
                Value: bookingStatus.name,
                Criticality: bookingStatus.criticality
            },
        ]
    },
    UI.FieldGroup #Details1: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Booking ID',
                Value: bookingID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value: bookingStatus_ID,
                Criticality: bookingStatus.criticality
            },
        ]
    },
    UI.FieldGroup #Details2: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Reader ID',
                Value: readerID_ID
            },
        ]
    },
    UI.FieldGroup #Details3: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Book ID',
                Value: bookID_ID
            },
        ]
    },
    UI.FieldGroup #Details4: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Begin date',
                Value: beginDate
            },
            {
                $Type: 'UI.DataField',
                Label: 'Begin time',
                Value: beginTime
            },
            {
                $Type: 'UI.DataField',
                Label: 'End date',
                Value: endDate
            },
            {
                $Type: 'UI.DataField',
                Label: 'End time',
                Value: endTime
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
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Booking information',
                    Target: '@UI.FieldGroup#Details1'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Reader information',
                    Target: '@UI.FieldGroup#Details2'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Book information',
                    Target: '@UI.FieldGroup#Details3'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Shedule',
                    Target: '@UI.FieldGroup#Details4'
                },
            ]
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

annotate service.Booking with {
    bookingID @readonly;
    readerID @mandatory;
    bookID @mandatory;
    bookingStatus @readonly;
    beginDate @readonly;
    beginTime @readonly;
    endDate @readonly;
    endTime @readonly;
};


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