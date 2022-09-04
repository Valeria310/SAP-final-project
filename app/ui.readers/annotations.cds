using LibraryService as service from '../../srv/service';

annotate service.Readers with @(
    UI.SelectionFields: [readerBirthday],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Reader ID',
            Value : readerID,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'First name',
            Value : firstName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last name',
            Value : lastName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Birthday',
            Value : readerBirthday,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Phone number',
            Value : phonenumber,
            ![@UI.Importance]: #High,
        },
    ],
    UI.PresentationVariant: {SortOrder: [{
        $Type: 'Common.SortOrderType',
        Property: lastName,
        Descending: false
    }]},
    UI.HeaderInfo: {
        TypeName: 'Reader',
        TypeNamePlural: 'Readers',
        Title: {Value: lastName},
        Description: {Value:firstName}
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
                Label: 'Date of birth',
                Value: readerBirthday
            },
            {
                $Type: 'UI.DataField',
                Label: 'Phone number',
                Value: phonenumber
            },
        ]
    },
    UI.FieldGroup #Details: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Reader ID',
                Value: readerID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: firstName
            },
            {
                $Type: 'UI.DataField',
                Label: 'Surname',
                Value: lastName
            },
            {
                $Type: 'UI.DataField',
                Label: 'Date of birth',
                Value: readerBirthday
            },
            {
                $Type: 'UI.DataField',
                Label: 'Phone number',
                Value: phonenumber
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

annotate service.Readers with {
    readerID @readonly;
    firstName @mandatory;
    lastName @mandatory;
    readerBirthday @mandatory;    
};

annotate service.Readers with @odata.draft.enabled;
