namespace sap.cap.productshop;
using{cuid}from'@sap/cds/common';
using{managed}from'@sap/cds/common';
aspect carbonemission{
    emission:Integer;
    rating:String;
}
aspect id {
    key ID:UUID;
}
type pricecost {
    price: Integer;
    stock:Integer;
}
entity Product:cuid,carbonemission,managed
{
    name : String;
    category : Integer;
    cost:pricecost;
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
}

