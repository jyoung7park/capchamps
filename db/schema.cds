namespace sap.cap.productshop;

using { cuid } from '@sap/cds/common';

using { managed } from '@sap/cds/common';

aspect carbonemission
{
    emission : Integer;
    rating : String;
}

aspect id
{
    key ID : UUID not null;
}

type pricecost
{
    price : Integer;
    stock : Integer;
}

entity Product : cuid, managed, carbonemission
{
    name : String;
    category : String;
    price : Integer;
    stock : Integer;
    crtiticality:Integer;
    //cost : pricecost;
    supplier : Association to one Supplier;
    conversation: Composition of many {
        key ID:UUID;
        timestamp: String;
        processor: String;
        message:String;
    }
}

/**
 * Supplier
 */
entity Supplier
{
    key ID : String;
    name : String(100);
    city : String(100);
    phone : String(100);
    products : Association to many Product on products.supplier = $self;
}
