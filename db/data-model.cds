namespace com.marcmauri.iot;

using { cuid, managed } from '@sap/cds/common';

entity Measure : cuid, managed {
  date  : Timestamp;
  temperature  : Decimal(5,2);
  humidity : Decimal(5,2);
};

