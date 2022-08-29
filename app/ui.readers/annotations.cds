using LibraryService as service from '../../srv/service';

annotate service.Readers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'reader ID',
            Value : readerID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'first name',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'last name',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'birthday',
            Value : readerBirthday,
        },
        {
            $Type : 'UI.DataField',
            Label : 'phone number',
            Value : phonenumber,
        },
    ]
);
annotate service.Readers with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'first name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'last name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'birthday',
                Value : readerBirthday,
            },
            {
                $Type : 'UI.DataField',
                Label : 'phone number',
                Value : phonenumber,
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

annotate service.Readers with @odata.draft.enabled;
