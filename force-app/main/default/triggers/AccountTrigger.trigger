// we write trigger  
trigger AccountTrigger on Account (before update, after update, before insert, after insert) {
    
    switch on Trigger.operationType{
        when BEFORE_UPDATE, BEFORE_INSERT {
            system.debug(' before update triggered');
            List<Account> accounts = Trigger.new; // return a list of accounts
            Account accountrecord = accounts[0];//fetch one recor
             
            if(accountrecord.Industry == Null){
                accountrecord.addError(' Industry field is mandatory');
            }
            
            
        }
        when AFTER_UPDATE , AFTER_INSERT{
            system.debug(' after update triggered');
            List<Account> accounts = Trigger.new; // return a list of accounts
            Account accountrecord = accounts[0];//fetch one record
            if (accountrecord.Rating == 'Hot'){
                Task followup = new Task();
                followup.WhatId = accountrecord.Id;
                followup.Subject = 'follow up task ';
                followup.Status = 'Progress';
                insert followup;
                
            }
            
        }
        
    }

}