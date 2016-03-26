global class BatchTransferData implements Database.Batchable<sObject>{
   global Database.QueryLocator start(Database.BatchableContext BC){
   String query='select id, name from Opportunity limit 10';
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
        for(sObject o:scope)
        {
           PartnerNetworkRecordConnection newConnection =new PartnerNetworkRecordConnection(
                        ConnectionId = '04P900000008bfd',
                        LocalRecordId = o.Id,
                        SendClosedTasks = false,
                        SendOpenTasks = false,
                        SendEmails = false);
                insert newConnection;
 
        }

    }

   global void finish(Database.BatchableContext BC){
               
           }
}