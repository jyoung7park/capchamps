using { sap.cap.productshop as my }  from '../db/schema';
//@protocol: 'rest'
service productshop {

    entity Product as projection on my.Product;
    entity Supplier as projection on my.Supplier;
    function MyFunction(name:String) returns String;
}