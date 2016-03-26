public class delEventHandler2 {
public String searchItem{set;get;}
public List<Lead> wrap;
public List<Wrapper> wrapped=new List<Wrapper>();
String marker=null;

public void setWrap()
{
            
    wrap=new List<Lead>();
    if(searchItem!=null && !searchItem.equals('')){
        wrap= [select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%'];
        }
    else 
        wrap=null;
    searchItem='';
   // wrapped.clear();//=new List<Wrapper>();
    Wrapper w;//        
    if(wrap!=null){
    wrapped.clear();
     for(Lead l:wrap)
      {
        w=new Wrapper(l.id,l.name,l.company,l.status);
        wrapped.add(w);     
          
      }
      }
}
public List<Wrapper> getWrap()
{   if(marker==null)
        setWrap();
    marker=null;
    return wrapped;
}
 public void closeLeads()
    {   
        Set<Id> ids=new Set<Id>();
        for(Wrapper l:wrapped)
         {System.debug('---'+l.name); 
            if(l.checked==true){         
            if(l.Status.equals('Working - Contacted') || l.Status.equals('Open - Not Contacted') )
             {
                System.debug('---'+l.name);             
                ids.add(l.id);                       
              } 
             }    
         }  
        List<Lead> newWrap=[select id,name,Company,status from Lead where id in :ids]; 
         for(Lead d:newWrap){
          d.Status='Closed - Converted';
           }     
        update newWrap;
    }
public void selectAllOpen()
{
    marker='marked';
    List<Wrapper> w=new List<Wrapper>();      
    if(wrapped!=null){
    //wrapped.clear();
     for(Wrapper l:wrapped)
      {
        if(l.Status.equals('Working - Contacted') || l.Status.equals('Open - Not Contacted') )
            l.setChecked(true);
        w.add(l);     
        System.debug('***'+l.checked);  
      }
      wrapped=w;
      }
}   
 
class Wrapper{
public boolean checked{set;get;}
public Id id{set;get;}
public String name{set;get;}
public String Company{set;get;}
public String Status{set;get;}
public Wrapper(Id id,String name,String Company,String Status)
{
        this.checked=false;
        this.id=id;
        this.name=name;
        this.Company=Company;
        this.Status=Status;  
}
public void setChecked(Boolean b)
{
    checked=b;
}
} 
}