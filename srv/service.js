const cds = require('@sap/cds');
const { request } = require('http');
const { stringify } = require('querystring');
module.exports = cds.service.impl(async function(srv) {
    
    srv.on('printhelloworld' , req => {
        console.log(req.data.input)
        return `$(req.data.input) World`
    }) 

    srv.on('addition', req =>{
            let result = req.data.num1 + req.data.num2;
            return result
    })
    
    srv.on('MyFunction', req =>{
            let result = {}
            if(req.data.category == 1){
                result.product = 'BMW',
                result.price = '1200 USD',
                result.location = 'New Delhi'
            }else{
                result.product = 'Audi',
                result.stock = 120,
                result.priceArray = {
                    "Price": 5200,
                    "Discount": '20 %'
                }
            }
            return result
    })
})

