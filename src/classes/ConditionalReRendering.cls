public class ConditionalReRendering {
public ConditionalReRendering()
{
    query=null;
}
public String query{set;get;}
public List<Account> acc{set;get;}
public void getData()
{
    if(query!=null && query!='')
        acc=[select id,name from Account limit 5];
    else
        acc=null;
}
}