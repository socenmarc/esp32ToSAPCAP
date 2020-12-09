using { IOTService } from './iot-service';

annotate IOTService.measure with @(
    UI : {
        SelectionFields : [
            date,
            temperature,
            humidity
        ],
        LineItem : [
            {Value : date},
            {Value : temperature},
            {Value : humidity},
            {Value : createdAt}
        ]
    }
);

annotate IOTService.measure with {
    date            @title: '{i18n>Date}';
    temperature     @title: '{i18n>Temperature}';
    humidity        @title: '{i18n>Humidity}';
}
