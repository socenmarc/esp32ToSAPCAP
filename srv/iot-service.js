const cds = require('@sap/cds')
const moment = require('moment');

// entities
const { Measure } = cds.entities('IOTService')

module.exports = cds.service.impl((srv) => {

     srv.before('CREATE', Measure, req => {   
        const { timestamp } = req.data
        req.data.date = moment(timestamp).format('YYYY-MM-DD')  
        req.data.year = moment(timestamp).format('YYYY')  
        req.data.toMeasureMonth_ID = moment(timestamp).format('MM')  
    }); 


    srv.after('GET', Measure, (each) => { 
 //     console.log('a')
        // Virtual fields
        /* each.vMonth = moment(each.date).format('MMM-YY')
        each.vYear = moment(each.date).format('YYYY')
 */
    });

});
