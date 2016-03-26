public class delEventHandler3 {
public String searchItem{set;get;}
public List<Lead> wrap=null;
public List<Wrapper> wrapped=new List<Wrapper>();
String marker=null;
public ApexPages.StandardSetController con {
        get{
        System.debug('---Inside get con');
            if(con == null && marker==null ){
            System.debug('---Inside con == null');
                //string queryString = 'Select id,name from Contact';//+ApexPages.CurrentPage().getParameters().get('id');
                con = new ApexPages.StandardSetController([select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%']);//Database.getQueryLocator(queryString));
                con.setPageSize(1);
            }
            return con;
        }set;
    }
public void setWrap()
{
   System.debug('---Inside setWrap');         
    wrap=new List<Lead>();
    if(searchItem!=null && !searchItem.equals('') ){
        System.debug('---Inside searchItem!=null');
         //con = new ApexPages.StandardSetController([select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%']);//Database.getQueryLocator(queryString));
         //con.setPageSize(2);
         wrap=null;
        wrap= (List<Lead>)con.getRecords();//[select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%'];
        }
    else{System.debug('---Inside else of searchItem!=null'); 
        wrap=null;}
    searchItem='';
   // wrapped.clear();//=new List<Wrapper>();
    Wrapper w;//        
    if(wrap!=null){
    System.debug('---Inside wrap!=null');
    wrapped.clear();
     for(Lead l:wrap)
      {
        w=new Wrapper(l.id,l.name,l.company,l.status);
        wrapped.add(w);     
          
      }
      }
}
public List<Wrapper> getWrap()
{   
    System.debug('---Inside getWrap');
    
    if(marker==null){System.debug('---Inside marker==null');
        con=null;
        setWrap();}
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

public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
  
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
  
    public void first() {
        con.first();
    }
  
    public void last() {
        con.last();
    }
  
    public void previous() {
        con.previous();
    }
  
    public void next() {
        System.debug('---Inside Next');
        marker='marked'; 
        con.next();
        setWrap();
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