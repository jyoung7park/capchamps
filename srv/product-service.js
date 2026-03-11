const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

    const  { Product } = srv.entities;
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
        console.log(req.data)
        console.log(req.params)

        const result = await SELECT `stock` .from(Product).where({ID:req.params[0]});
        console.log("<<select query",result);
    })
})