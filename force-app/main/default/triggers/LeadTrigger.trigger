trigger LeadTrigger on Lead (before insert, before update, after update) {   
    /*//System.debug('Lead trigger called ');
    system.debug('trigger size: ' + Trigger.size);
    system.debug('is executing: '+Trigger.isExecuting);
    system.debug('is operation type: '+Trigger.operationType);
    for(Lead leadRecord : Trigger.new){
        If(string.isBlank(leadRecord.LeadSource) && Trigger.isInsert) // isblank is a method from stringclass ,that why we used string before isblank 
        {
           leadRecord.LeadSource = 'Other';
        } 
        if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted')
        {
            leadRecord.Status.addError('we can not directly close an open status');
        }

        
        if(string.isblank(leadRecord.Industry) && Trigger.isInsert){
            leadRecord.addError('The Industry can not be blank');
            
        }
   }*/
    
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            leadTriggerHandler.beforeInsertTrigger(Trigger.new);
        }

        when AFTER_INSERT {
           leadTriggerHandler.afterInsertTrigger(Trigger.new); 
            
        }

        when BEFORE_UPDATE {
           leadTriggerHandler.beforeUpdateTrigger(Trigger.new, Trigger.oldMap); 
        }
    }

}