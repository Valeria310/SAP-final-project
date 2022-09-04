using LibraryService as service from '../../srv/service';

annotate service.Authors with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'author ID',
            Value : authorID,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'first name',
            Value : firstName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'last name',
            Value : lastName,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'birthday',
            Value : birthday,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Label : 'country',
            Value : country,
            ![@UI.Importance]: #High,
        },
    ],
    UI.PresentationVariant: {SortOrder: [{
        $Type: 'Common.SortOrderType',
        Property: lastName,
        Descending: false
    }]},
    UI.HeaderInfo: {
        TypeName: 'Author',
        TypeNamePlural: 'Authors',
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
                Label: 'Surname',
                Value: lastName
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: firstName
            },
        ]
    },
    UI.FieldGroup #Details: {
        Data: [
            {
                $Type: 'UI.DataField',
                Label: 'Author ID',
                Value: authorID
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
                Value: birthday
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: country
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

annotate service.Authors with {
    authorID @readonly;
    firstName @mandatory;
    lastName @mandatory;
};


annotate service.Authors with @odata.draft.enabled;
