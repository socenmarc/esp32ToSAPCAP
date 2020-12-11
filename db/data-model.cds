namespace com.marcmauri.iot;

using {
  cuid,
  managed
} from '@sap/cds/common';

entity Measure : cuid, managed {
  device         : Association to Device;
  timestamp      : Timestamp;
  date           : Date;
  temperature    : Decimal(5, 2);
  humidity       : Decimal(5, 2);
  virtual vMonth : String(10);
  virtual vYear  : String(4);
};

entity Device : cuid, managed {
  device   : String;
  measures : Association to many Measure
               on measures.device = $self;
}
