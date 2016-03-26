public class HardCodedIDsController {

public String id{get;set;}
public String name{get;set;}
public HardCodedIDsController()
{
    Account acc=[select id,name from Account limit 1];
    id=acc.id;
    name=acc.name;
}
}