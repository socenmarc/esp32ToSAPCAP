using {IOTService} from './iot-service';

annotate IOTService.Measure with @(UI : {
    SelectionFields : [
        device.device,
        date,
        temperature,
        humidity,
        vMonth,
        vYear
    ],
    LineItem        : [
        {Value : device.device},
        {Value : timestamp},
        {Value : date},
        {Value : temperature},
        {Value : humidity},
        {Value : createdAt}
    ]
});

annotate IOTService.Measure with @(
    sap.semantics : 'aggregate'
);

annotate IOTService.Measure with {
    date        @title                : '{i18n>Date}';
    temperature @title                : '{i18n>Temperature}';
    humidity    @title                : '{i18n>Humidity}';

    ID          @(
        sap.aggregation.role : 'dimension',
        UI                   : {Hidden : true}
    );
    date        @sap.aggregation.role : 'dimension';
    temperature @sap.aggregation.role : 'measure';
    humidity    @sap.aggregation.role : 'measure';
}
