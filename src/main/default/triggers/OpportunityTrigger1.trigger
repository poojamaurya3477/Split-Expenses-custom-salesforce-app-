trigger OpportunityTrigger1 on Opportunity (before insert, before update, after insert , after update) {
    
  
  switch on Trigger.operationType{
      
      when BEFORE_INSERT, BEFORE_UPDATE{
          
          //update the next step on opportunity to 'update a contrat'
          for (Opportunity opp : Trigger.new){
          if(opp.NextStep == Null){
              opp.NextStep = 'Onboard a Contract';
          }
      }
      }
      
  
  
  
  
      when AFTER_INSERT, AFTER_UPDATE{
          List<Task> tasks = new List<Task>();
          for (Opportunity opp : Trigger.new) {
          	if( opp.StageName == 'Closed Won'){
              Task Followup = new Task();
              Followup.WhatId = opp.Id;
              Followup.Subject = 'Follow up task';
              tasks.add(Followup);
          }
      }
          insert tasks;
  }
    
    
      

}
}