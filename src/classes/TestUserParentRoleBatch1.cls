public class TestUserParentRoleBatch1 implements Database.batchable<sObject>
{
public static List<String> lines;

public TestUserParentRoleBatch1()
{
// lines=new List<string>(); 
lines=new List<String>();
}



public Database.QueryLocator start(Database.BatchableContext BC)
{

return Database.getQueryLocator('select id,name,userroleid from user where userroleid!=null limit 10');

}

public void execute(Database.BatchableContext BC, List<User> scope)
{
lines.add('Abc');
lines.add('Abc');
lines.add('Abc');

System.debug('Excute'+lines);
}
public void finish(Database.BatchableContext BC)
{
System.debug('Abhijit'+lines.size());
System.debug('Abhijit'+lines);
}

}