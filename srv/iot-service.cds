using com.marcmauri.iot as my from '../db/data-model';

service IOTService {
    @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable: true,
        DeleteRestrictions.Deletable: true  
    } 
    //@odata.draft.enabled
    entity Measure as projection on my.Measure;

    @readonly
    entity MeasureView as select from my.Measure {
        ID,
        timestamp,
        date,
        temperature,
        humidity,
        toDevice.ID as deviceID,
        toDevice.device as deviceName,
        toDevice.location as deviceLocation,
        year,
        toMeasureMonth.ShortDescription || '-' || year as measureMonthYear : String,        
        toMeasureMonth.ID as measureMonthID,
        toMeasureMonth.Description as measureMonthDescription,
        toMeasureMonth.ShortDescription as measureMonthShortDescription
    };

    entity Device as projection on my.Device excluding { measures }
    entity DeviceAggregation as select from my.Device left outer join Measure on Device.ID = Measure.toDevice.ID {
        key Device.ID as deviceID,
        Device.device as deviceName,
        Device.location as deviceLocation,
        count(Measure.date) as measuresCount: Integer,
        avg(Measure.temperature) as temperatureAvg: Decimal(5,2),
        avg(Measure.humidity) as humidityAvg: Decimal(5,2),
    } group by Device.ID;

    entity MeasureAggregation as select from MeasureView left outer join my.Device on Device.ID = MeasureView.deviceID {
        key MeasureView.ID as ID,
        measureMonthDescription,
        measureMonthShortDescription,
        measureMonthID,
        date,
        year,
        count(date) as measuresCount: Integer,
        avg(temperature) as temperatureAvg: Decimal(18,15),
        avg(humidity) as humidityAvg: Decimal(18,15),
    } group by date;
 

} 
