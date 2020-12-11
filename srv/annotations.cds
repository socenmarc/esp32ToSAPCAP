using {IOTService} from './iot-service';

annotate IOTService.MeasureView with @(UI : {
    SelectionFields : [
        deviceID,
        deviceName,
        date,
        temperature,
        humidity,
        year,
        measureMonthID
    ],
    LineItem        : [
        {Value : deviceLocation},
        {Value : deviceName},
        {Value : timestamp},
        {Value : date},
        {Value : temperature},
        {Value : humidity}
    ]
});

annotate IOTService.MeasureView with @(sap.semantics : 'aggregate');

annotate IOTService.MeasureView with {
    date                         @title                : '{i18n>Date}';
    timestamp                    @title                : '{i18n>Timestamp}';
    temperature                  @title                : '{i18n>Temperature}';
    humidity                     @title                : '{i18n>Humidity}';
    deviceID                     @title                : '{i18n>Device Location}';
    deviceName                   @title                : '{i18n>Device ID}';
    deviceLocation               @title                : '{i18n>Device Location}';
    year                         @title                : '{i18n>Year}';
    measureMonthYear             @title                : '{i18n>Month}';
    measureMonthID               @title                : '{i18n>Month}';
    measureMonthDescription      @title                : '{i18n>Month}';
    measureMonthShortDescription @title                : '{i18n>Month}';

    ID                           @(
        sap.aggregation.role : 'dimension',
        UI                   : {Hidden : true}
    );
    date                         @sap.aggregation.role : 'dimension';
    timestamp                    @sap.aggregation.role : 'dimension';
    temperature                  @sap.aggregation.role : 'measure';
    humidity                     @sap.aggregation.role : 'measure';
    deviceID                     @sap.aggregation.role : 'dimension';
    deviceName                   @sap.aggregation.role : 'dimension';
    deviceLocation               @sap.aggregation.role : 'dimension';
    year                         @sap.aggregation.role : 'dimension';
    measureMonthYear             @sap.aggregation.role : 'dimension';
    measureMonthID               @sap.aggregation.role : 'dimension';
    measureMonthDescription      @sap.aggregation.role : 'dimension';
    measureMonthShortDescription @sap.aggregation.role : 'dimension';
}

annotate IOTService.MeasureAggregation with @(sap.semantics : 'aggregate');

annotate IOTService.MeasureAggregation with {
    date                         @title                : '{i18n>Date}';
    measuresCount                @title                : '{i18n>Measures}';
    temperatureAvg               @title                : '{i18n>Temperature}';
    humidityAvg                  @title                : '{i18n>Humidity}';
    year                         @title                : '{i18n>Year}';
    measureMonthID               @title                : '{i18n>Month}';
    measureMonthDescription      @title                : '{i18n>Month}';
    measureMonthShortDescription @title                : '{i18n>Month}';

    ID                           @(
        sap.aggregation.role : 'dimension',
        UI                   : {Hidden : true}
    );
    measureMonthDescription      @sap.aggregation.role : 'dimension';
    measureMonthShortDescription @sap.aggregation.role : 'dimension';
    measuresCount                @sap.aggregation.role : 'measure';
    temperatureAvg               @sap.aggregation.role : 'measure';
    humidityAvg                  @sap.aggregation.role : 'measure';
    measureMonthID               @sap.aggregation.role : 'dimension';
    year                         @sap.aggregation.role : 'dimension';
}

annotate IOTService.DeviceAggregation with @(sap.semantics : 'aggregate');

annotate IOTService.DeviceAggregation with {
    deviceID                     @title                : '{i18n>Device Location}';
    deviceName                   @title                : '{i18n>Device ID}';
    deviceLocation               @title                : '{i18n>Device Location}';
    measuresCount                @title                : '{i18n>Measures}';
    temperatureAvg               @title                : '{i18n>Temperature}';
    humidityAvg                  @title                : '{i18n>Humidity}';

    deviceID       @(
        sap.aggregation.role : 'dimension',
        Common               : {Text : {
            $value                 : deviceLocation,
            UI.TextArrangement     : #TextOnly
        }}
    );
    deviceName     @sap.aggregation.role : 'dimension';
    measuresCount  @sap.aggregation.role : 'measure';
    temperatureAvg @sap.aggregation.role : 'measure';
    humidityAvg    @sap.aggregation.role : 'measure';
}
