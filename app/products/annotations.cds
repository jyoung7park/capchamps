using productshop as service from '../../srv/product-service';
using from '../../db/schema';

annotate service.Product with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : 'price',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
            {
                $Type : 'UI.DataField',
                Value : rating,
                Label : 'rating',
            },
            {
                $Type : 'UI.DataField',
                Value : category,
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
            Label : '{i18n>SupplierInformation}',
            ID : 'i18nSupplierInformation',
            Target : '@UI.FieldGroup#i18nSupplierInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Converstion',
            ID : 'Converstion',
            Target : 'conversation/@UI.LineItem#Converstion',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>FingerPrint}',
            Inline : true,
            Criticality : #Positive,
            IconUrl: 'sap-icon://biometric-thumb',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Product}',
            Value : name,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>Orderproduct}',
            Inline : true,
            Criticality : #Negative,
        },
        {
            $Type : 'UI.DataField',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : price,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.createPO',
            Label : '{i18n>PurchaseOrder}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#crtiticality',
            Label : '{i18n>5starRate}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#emission1',
            Label : '{i18n>Emission}',
        },
    ],
    UI.SelectionFields : [
        name,
        category,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : supplier.name,
        },
        TypeImageUrl:'sap-icon://car-rental',
        Criticality : #Positive,
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>Orderproduct}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>Fingerprint}',
            Determining : true,
            Criticality : #Positive,
        },
    ],
    UI.FieldGroup #i18nSupplierInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.phone,
                Label : 'phone',
            },
        ],
    },
    UI.DataPoint #emission : {
        Value : emission,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #crtiticality : {
        Value : crtiticality,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #emission1 : {
        Value : emission,
        Visualization : #Progress,
        TargetValue : 4000,
        Criticality : crtiticality,
    },
);

annotate service.Product with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Supplier',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.Product with {
    name @Common.Label : '{i18n>Product}'
};

annotate service.Product with {
    category @Common.Label : '{i18n>Category}'
};

annotate service.Product.conversation with @(
    UI.LineItem #Converstion : [
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.processor,
            Label : 'processor',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.timestamp,
            Label : 'timestamp',
        },
    ]
);

annotate service.Supplier with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Supplier',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Supplier with {
    ID @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

