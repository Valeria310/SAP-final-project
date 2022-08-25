using LibraryService as service from '../../srv/service';

annotate service.Authors with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'author ID',
            Value : authorID,
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
            Value : birthday,
        },
        {
            $Type : 'UI.DataField',
            Label : 'country',
            Value : country,
        },
    ]
);
annotate service.Authors with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Label : 'author ID',
            Value : authorID,
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
            Value : birthday,
        },
        {
            $Type : 'UI.DataField',
            Label : 'country',
            Value : country,
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
