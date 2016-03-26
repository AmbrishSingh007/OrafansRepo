global class RunBatch implements Schedulable
{
    //code for scheduling 
    global void execute(SchedulableContext ctx) {
    BatchQ1 obj=new BatchQ1();
    ID batchprocessid = Database.executeBatch(obj);
    }
    
}