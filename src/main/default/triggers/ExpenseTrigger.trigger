trigger ExpenseTrigger on Expense__c (after insert, after update, after delete) {
    ExpenseTriggerHandler handler = new ExpenseTriggerHandler();
    
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            handler.handleAfterInsert(Trigger.new);
        } else if (Trigger.isUpdate) {
            handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        } else if (Trigger.isDelete) {
            handler.handleAfterDelete(Trigger.old);
    }

}