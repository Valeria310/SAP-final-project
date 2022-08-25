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
            Label : 'reader ID',
            Value : readerID.ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book ID',
            Value : bookID.bookID,
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
            Label : 'booking ID',
            Value : bookingID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'reader ID',
            Value : readerID.ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'book ID',
            Value : bookID.bookID,
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
