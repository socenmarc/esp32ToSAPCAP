namespace com.marcmauri.iot;

using {
  cuid,
  managed
} from '@sap/cds/common';

entity Measure : cuid, managed {
  timestamp      : Timestamp;
  date           : Date;
  year           : String(4);
  temperature    : Decimal(5, 2);
  humidity       : Decimal(5, 2);
  toDevice       : Association to Device;  
  toMeasureMonth : Association to Months;
};

entity Device : managed {
  key ID   : UUID;         //si en comptes d'això poso l'aspect cuid, dona error el device.ID a la entitat MeasureView del servei
  location : String;
  device   : String;
  measures : Association to many Measure
               on measures.toDevice = $self;
};

@cds.autoexpose
entity Months {
    key ID               : String(2);
        Description      : localized String;
        ShortDescription : localized String(3);
};
