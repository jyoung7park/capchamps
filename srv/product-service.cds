using {sap.cap.productshop as my} from '../db/schema';

//@protocol: 'rest'
service productshop {

    @odata.draft.enabled
    entity Product  as projection on my.Product
        actions {
            action orderProduct(stock: Integer @title: 'Stock' );
            action fingerprint(name: String);
            action createPO(name: String);
        };

    entity Supplier as projection on my.Supplier;
    function MyFunction(name: String) returns String;
    action   MyAction(name: String)   returns String;
}

//annotate productshop with @(requires:'prductmanager');
