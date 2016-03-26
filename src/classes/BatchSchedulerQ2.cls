global class BatchSchedulerQ2
{
    public static String CRON_EXP = '0 0 9 * * ?';
    public void execute() {
    RunBatch m=new RunBatch();
    String jobID = system.schedule('Batch Job',CRON_EXP, m);
    }
}