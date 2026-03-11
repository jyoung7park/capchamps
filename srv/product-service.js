const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

    //const  { Product } = srv.entites;
    //srv.before('READ','Product',async(req) =>{
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
    
})