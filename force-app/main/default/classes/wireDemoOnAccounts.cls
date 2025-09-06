public class wireDemoOnAccounts {
    @AuraEnabled(cacheable=true)
        public static List<Account> getAccountList(){
               
            List<Account> AccountDetails = [Select Id, Name, Phone from Account];
            return AccountDetails;
            
            
        }

}