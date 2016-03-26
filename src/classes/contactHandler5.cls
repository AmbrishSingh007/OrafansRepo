public class contactHandler5 {

    public contactHandler5(ApexPages.StandardController controller) {

    }

//public String searchItem{set;get;}
public List<Contact> wrap;
public List<Wrapper> wrapped=new List<Wrapper>();
public List<Contact> updateCon=new List<Contact>();
public List<Contact> getData(){
if(updateCon.size()>0){
    System.debug('----'+'inside'+updateCon.get(0).name);
    return updateCon;
    }
    return null;
}
public PageReference getGotoDetailPage()
    {
        return Page.Q5ExtraPage;
    }

public void setWrap()
{
    wrap=new List<Contact>();
    if(ApexPages.CurrentPage().getParameters().get('id')!=null)
        wrap= [select id,name,AccountId from Contact where AccountId=:ApexPages.CurrentPage().getParameters().get('id')];
    else 
        wrap=null;// [select id,name,Company,Status from Lead];
    //searchItem='';
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
    System.debug('---');   
    if(wrapped!=null){  
          
        for(Wrapper c:Wrapped)
        {   
        if(c.checked==true)
            //System.debug('***'+c.checked);
            updateCon.add(c.con);
        }
        System.debug('+++'+'updateCon.get(0).checked'+' '+updateCon.get(0).name);
        //update updateCon;
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