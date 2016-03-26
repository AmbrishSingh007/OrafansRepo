global class Test_Stateful implements Database.Batchable<sObject>,Database.Stateful{
   global final String Query;
   global Integer i=0;
   global Test_Stateful(){
      query='select id,name from UserData__c';
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
       List<sObject> ud=new List<UserData__c>();
        for(SObject  u:scope){
            i++;
            u.put('Sequence__c',i);
            ud.add(u);
        }   
        update ud; 
    }

   global void finish(Database.BatchableContext BC){
        System.debug('---Total no of records'+i);
   }
}