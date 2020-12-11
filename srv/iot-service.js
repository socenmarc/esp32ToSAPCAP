const cds = require('@sap/cds')
const moment = require('moment');

// entities
const { Measure } = cds.entities('IOTService')

module.exports = cds.service.impl((srv) => {

    srv.before('CREATE', Measure, req => {   
        const { timestamp } = req.data
        req.data.date = moment(timestamp).format('YYYY-MM-DD')  
    });

    srv.after('CREATE', Measure, (each) => { 
        console.log('aqui')
    });

    srv.after('GET', Measure, (each) => { 
      
        // Virtual fields
        each.vMonth = moment(each.date).format('MMM-YY')
        each.vYear = moment(each.date).format('YYYY')

    });

});
