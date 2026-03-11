using { sap.cap.productshop as my }  from '../db/schema';
//@protocol: 'rest'
service productshop {

    entity Product as projection on my.Product actions{
        action orderProduct(name:String,stock:Integer);
        action createPO(name:String);
    };
    entity Supplier as projection on my.Supplier;
    function MyFunction(name:String) returns String;
    Action MyAction(name:String) returns String;
}