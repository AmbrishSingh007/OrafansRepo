public class delEventHandler {
public String searchItem{set;get;}
public List<Lead> wrap{set;get;}
public Integer count{set;get;}

public List<Lead> getWrapData()
{   
    if(searchItem!=null && !searchItem.equals(''))
        wrap= [select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%'];
    else 
        wrap=null;
    return wrap;
}
 public void closeLeads()
    {   count=0;
        if(wrap!=null){
            for(Lead l:wrap)
             {
                if(l.Status.contains('Working - Contacted')) 
                 {
                    l.status='Closed - Converted'; 
                    count++;            
                  }      
             }  
            update wrap;
        }
    }
 
}