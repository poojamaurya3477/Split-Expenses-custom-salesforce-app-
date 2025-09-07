public class leadTriggerHandler {
    
    public static void beforeInsertTrigger(List<Lead> newRecords){
        for(Lead leadRecord : newRecords){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
                // validation rules on Industry fields
                if(String.isBlank(leadRecord.Industry)){
                    leadRecord.addError('The industry field cannot be blank');
                }
            }
    }
        
        public static void afterInsertTrigger(List<Lead> newRecords){
            for(Lead leadRecord : newRecords){
                // create a task
                Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id , Status='Not Started');
                insert leadTask;
            }
             //inserting another lead in After insert which will callthe trigger recursively.
            Lead anotherLead= new Lead(LastName= 'Test single record ', Status= 'Open Not-Contacted' , Industry = 'Agriculture');
            insert anotherLead;
        }
        
        
		public static void beforeUpdateTrigger(List<Lead> newRecords, Map<Id, Lead> oldMapRecords){
            for(Lead leadRecord : newRecords){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
                
                if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && oldMapRecords.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                    leadRecord.Status.addError('You cannot directly close an open lead record');
                }
            }
            
            
        }
    }