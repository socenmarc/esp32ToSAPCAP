using com.marcmauri.iot as my from '../db/data-model';

service IOTService {
    @Capabilities: { 
        InsertRestrictions.Insertable: false,
        UpdateRestrictions.Updatable: true,
        DeleteRestrictions.Deletable: true  
    }
    @odata.draft.enabled
    entity measure as projection on my.Measure;
} 