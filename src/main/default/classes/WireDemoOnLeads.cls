public class WireDemoOnLeads {
    @auraEnabled(Cacheable=true)
    Public static List<Lead> getLeadList(){
        
        List<Lead> LeadDetails = [select Id, Name, Status from Lead limit 10];
        return LeadDetails;
        
    }
        
    }