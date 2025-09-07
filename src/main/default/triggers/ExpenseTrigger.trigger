trigger ExpenseTrigger on Expense__c (after insert,after update) {
    
    if(Trigger.isafter&& Trigger.isupdate){
        System.debug('Expense trigger is fired');
        ExpenseService.DistributeService(Trigger.new);
        
    }

}