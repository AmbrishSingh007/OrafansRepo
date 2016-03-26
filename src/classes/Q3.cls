public class Q3
{
    public void checkDate()
    {
    Date d=(Date.today()).addDays(-15);
    List<Opportunity> opp=[select id,name,OwnerId from Opportunity where lastmodifieddate<:d];
    Set<Id> ids=new Set<Id>();
    for(Opportunity o:opp)
    {
        ids.add(o.OwnerId);
    } 
    List<User> users=[select email from User where id in :ids];
    
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        String[] toAddresses = new String[users.size()];
        Integer x=0;
        for(User u:users)
             toAddresses[x++]=u.email+''; 
        mail.setToAddresses(toAddresses); 
        mail.setSubject('Automated email: Count of Accounts'); 
        String body = 'You havent modified your opportunity in last 15 days'; 
        mail.setPlainTextBody(body); 
        Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
        
        for(String s:toAddresses)
            System.debug('---'+s);
    }
}