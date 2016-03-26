public class Q4Scheduler
{
   public static String CRON_EXP = '0 0 2 * * ?';
    public void execute() {
    Q4 m=new Q4();
    String jobID = system.schedule('Batch Job',CRON_EXP, m);
    }
}