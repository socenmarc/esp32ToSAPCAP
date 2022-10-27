const cds = require('@sap/cds')
const moment = require('moment');

// entities
const { Measure, Device } = cds.entities('IOTService')

module.exports = cds.service.impl((srv) => {

     srv.before('CREATE', Measure, async req => {   
        const { timestamp } = req.data
        const { device } = req.headers

        if (!device) req.reject('Device not specified')

        req.data.date = moment(timestamp).format('YYYY-MM-DD')  
        req.data.year = moment(timestamp).format('YYYY')  
        req.data.toMeasureMonth_ID = moment(timestamp).format('MM')  

        const incomingDevice = await SELECT.one(Device).where({device:device})
        if ( incomingDevice ){
         req.data.toDevice_ID = incomingDevice.ID
        } else {
         const newDevice = await srv.create(Device).entries({device:device, location:device})
         if ( newDevice ){
            req.data.toDevice_ID = newDevice.ID
         } else {
            req.reject('Error registering new device')
         }
        }
    }); 


/*     srv.after('GET', Measure, (each) => {  */
 //     console.log('a')
        // Virtual fields
        /* each.vMonth = moment(each.date).format('MMM-YY')
        each.vYear = moment(each.date).format('YYYY')
 */
/*     }); */

});
