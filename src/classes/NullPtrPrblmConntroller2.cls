public class NullPtrPrblmConntroller2 {
public String query{set;get;}
public List<Wrapper> accs{set;get;}
/*public List<Wrapper> getAccs(){
    return accs;
}*/

public void refresh()
{
    String q='select id,name from Account where name like :'+'%'+query+'%';
    List<Account> acs=[select id,name from Account where name like : '%'+query+'%' ];
    accs=new List<Wrapper>();
    for(Account a:acs)
    {
        Wrapper w=new Wrapper();
        w.setCheck(false);
        w.setId(a.id);
        w.setName(a.name);
        accs.add(w);
    }
    
}
public void sendSelected()
{    
    for(Wrapper w:accs)
    {
        if(w.getCheck()==true)
            System.debug('---'+w);
    }
}
class Wrapper{
Boolean check;
String id,name;
public Wrapper(){}
public Boolean getCheck() {
    return check;
}
public void setCheck(Boolean check) {
    this.check = check;
}
public String getId() {
    return id;
}
public void setId(String id) {
    this.id = id;
}
public String getName() {
    return name;
}
public void setName(String name) {
    this.name = name;
}

}
}