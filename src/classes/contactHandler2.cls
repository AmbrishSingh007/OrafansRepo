public class contactHandler2 {

    public contactHandler2(ApexPages.StandardController controller) {

    }

public String searchItem{set;get;}
public List<Contact> wrap;
public List<Wrapper> wrapped=new List<Wrapper>();
public List<Contact> updateCon=new List<Contact>();
public void setWrap()
{
    wrap=new List<Contact>();
    if(ApexPages.CurrentPage().getParameters().get('id')!=null)
        wrap= [select id,name,AccountId,Email,Phone,Fax from Contact where AccountId=:ApexPages.CurrentPage().getParameters().get('id')];
    else 
        wrap=null;// [select id,name,Company,Status from Lead];
    searchItem='';
   // wrapped.clear();//=new List<Wrapper>();
    Wrapper w;//        
    if(wrap!=null){
    wrapped.clear();
     for(Contact l:wrap)
      {
        w=new Wrapper(l);
        wrapped.add(w);     
          
      }
      }
}
public List<Wrapper> getWrap()
{   
    setWrap();
    return wrapped;
}
 public void UpdateContacts()
    {
    System.debug('-------------');   
    if(wrapped!=null){  
          
        for(Wrapper c:Wrapped)
        {   //System.debug('***'+c.checked);
            if(c.checked==true)
            updateCon.add(c.con);
        }
        //System.debug('+++'+'updateCon.get(0).checked'+' '+updateCon.get(0).name);
        update updateCon;
        }
    }
class Wrapper{
public boolean checked{set;get;}
public Contact con{get;set;}
public Wrapper(Contact c)
{
        checked=false;
        con=c;  
}
} 
}