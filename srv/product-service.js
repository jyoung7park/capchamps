const cds = require('@sap/cds');
//const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

module.exports = cds.service.impl(async function (srv) {

    const  { Product } = srv.entities;
    let orignalstock;
    let ID;
    //srv.before('READ','orderProduct',async(req) =>{
    //    console.log("<<I am in 'BEFORE' Handler")
    //})
    //srv.on('READ','Product',async(req) =>{
    //    console.log("<<I am in 'ON' Hander")
    //})
    //srv.after('READ','Product',async(req) =>{
    //    console.log("<<I am in 'AFTER' Hander")
    //})

    srv.on('MyFunction',async(req) =>{
        let result = `Super Cool ${req.data.name}`;
        return result;
    })

    srv.on('MyAction',async(req) =>{
        let result = `Super Cool ${req.data.name}`;
        return result;
    })

    srv.before('orderProduct',async(req) =>{
        console.log(req.data);
        console.log(req.params);
        //const result = [{ stock: 300 }];
        const result = await SELECT `stock`  .from(Product).where({ID:req.params[0]});
        
        orignalstock = result[0].stock;
        ID = req.params[0];
        console.log("<<Orignal Stock",orignalstock);  


        if(orignalstock > 500){
            return req.error({
                code:'400',
                message:'Stock should not be greater than 500'
            })
        }
    })
    srv.on('orderProduct',async(req) =>{
        let updatestock = req.data.stock + orignalstock
        console.log("<<updated Stock",updatestock);  
        const result = await UPDATE(Product).with({stock:updatestock}).where({ID:ID});
        console.log("<<updated query result ",result); 

        return req.notify("Order Placed Update stock is now ${updatestock}")
    })
})