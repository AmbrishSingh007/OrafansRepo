global class BatchQ3 implements Database.Batchable<sObject>, Schedulable{


   global Database.QueryLocator start(Database.BatchableContext BC){
    Date d=(Date.today()).addDays(-15);
    String query='select id,name,OwnerId from Opportunity where lastmodifieddate<:'+d;
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
        Set<Id> ids=new Set<Id>();
        for(sObject o:scope)
            ids.add(((Opportunity)o).OwnerId);
        Map<Id,User> uMap=new Map<Id,User>([select id,name,email from User where id in :ids]);        
        String details='';
        for(sObject o:scope)
        {
            Opportunity op=(Opportunity)o;
            details='\n\nId: '+op.id+' Name: '+op.name;
            String[] email=new String[]{uMap.get(op.OwnerId).email};
            sendMail(email,details);
        }
        
    }

   global void finish(Database.BatchableContext BC){
   
   }
   public void sendMail(String[] toAddress,String details)
   {
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
       mail.setToAddresses(toAddress); 
       mail.setSubject('Automated email: Update on Opportunity'); 
       String body = 'You havent modified your opportunity in last 15 days '+details; 
       mail.setPlainTextBody(body); 
       Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
   }
   global void execute(SchedulableContext ctx) {
        BatchQ3 obj=new BatchQ3();
        Database.executeBatch(obj);
    }
}