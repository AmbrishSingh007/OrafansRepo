global class BatchSchedulerQ3
{
    public static String CRON_EXP = '* * * L * ?';
    public void execute() {
    BatchQ3 m=new BatchQ3();
    String jobID = system.schedule('Batch Job',CRON_EXP, m);
    }
}