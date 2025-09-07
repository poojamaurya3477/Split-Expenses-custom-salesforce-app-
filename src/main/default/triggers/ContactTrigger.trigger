//Question : Contact has a checkboxfield 'active'. the account objects has a number fields 'Count Active'.you need to show total active child contact on parent account.  
trigger ContactTrigger on Contact ( after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            
        }
    }
    

}