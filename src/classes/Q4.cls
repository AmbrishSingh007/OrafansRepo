global class Q4 implements Schedulable
{
//OpportunityProduct x=[select id,name from OpportunityProduct] ;
// Product2 x= [select id,name,LastModifiedDate,SystemModstamp from Product2 where LastModifiedDate=:Date.today()];// and SystemModstamp
   public void checkProduct()
   {
       Datetime myDT = (Datetime.now()).addHours(-2);
       String currTime = myDT.format('HH:mm:ss');
       List<OpportunityLineItem> opLine=[select id,name,CreatedDate,SystemModstamp from OpportunityLineItem where CreatedDate=:Date.today() and SystemModstamp>=:myDT];
       for(OpportunityLineItem op:opLine)
       {
           System.debug(''+op.id+' '+op.name+' '+op.CreatedDate+' '+op.SystemModstamp);//
       }
   }
   
   global void execute(SchedulableContext ctx) {
        BatchQ3 obj=new BatchQ3();
        Database.executeBatch(obj);
    }
}