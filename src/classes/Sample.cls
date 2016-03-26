public class Sample
{
   public  Id id{set;get;}
   public String name{set;get;}
   public Sample()
   {
       id='0019000000twDIe';
       name='Rocky1';
   }
   public Id display(Id nid)
   {
       Account a=null;
       a=[select id,name from Account where id=:nid];
       System.debug('+'+a.id+' '+a.name);
       return a.id;
   }
   public void displayAll()
   {
       List<Account> accs=[select id,name from Account];
       for(Account a:accs)
           System.debug('---'+a.id+' '+a.name);
   }
}