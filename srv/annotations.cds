using {IOTService} from './iot-service';

annotate IOTService.MeasureView with @(UI : {
    SelectionFields : [
    deviceName,
    date,
    temperature,
    humidity,
    year,
    measureMonthID
    ],
    LineItem        : [
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
    temperature                  @title                : '{i18n>Temperature}';
    humidity                     @title                : '{i18n>Humidity}';

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
    year                         @sap.aggregation.role : 'dimension';
    measureMonthID               @sap.aggregation.role : 'dimension';
    measureMonthDescription      @sap.aggregation.role : 'dimension';
    measureMonthShortDescription @sap.aggregation.role : 'dimension';
}

annotate IOTService.MeasureAggregation with @(sap.semantics : 'aggregate');

annotate IOTService.MeasureAggregation with {
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
