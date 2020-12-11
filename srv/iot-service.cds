using com.marcmauri.iot as my from '../db/data-model';

service IOTService {
    @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable: true,
        DeleteRestrictions.Deletable: true  
    } 
    //@odata.draft.enabled
    entity Measure as projection on my.Measure;

    entity Device as projection on my.Device;

    entity DeviceAggregation as select from my.Device left outer join my.Measure on Device.ID = Measure.device.ID {
        key Device.ID,
        Device.device,
        count(Measure.date) as measuresCount: Integer,
        avg(Measure.temperature) as temperatureAvg: Decimal(5,2),
        avg(Measure.humidity) as humidityAvg: Decimal(5,2),
    } group by Device.ID;

    entity MeasureAggregation as select from Measure {
        key ID,
        device,
        count(date) as measuresCount: Integer,
        avg(temperature) as temperatureAvg: Decimal(18,15),
        avg(humidity) as humidityAvg: Decimal(18,15),
    } group by date;

} 