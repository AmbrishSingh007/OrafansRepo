global class BatchQ1 implements Database.Batchable<sObject>{
   global final String Query;
   global BatchQ1(){
      query='select id,name from Account';
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){

    }

   global void finish(Database.BatchableContext BC){
        AsyncApexJob JobDetails=[select ApexClassID,TotalJobItems,Status,JobItemsProcessed,CompletedDate from AsyncApexJob where Id =:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        String[] toAddresses = new String[] {'ambrish.singh@zensar.in'}; 
        mail.setToAddresses(toAddresses); 
        mail.setSubject('Automated email: Count of batch executions'); 
        String body = 'The no. of times the batch executed is '+JobDetails.TotalJobItems; 
        mail.setPlainTextBody(body); 
        Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
   }
}