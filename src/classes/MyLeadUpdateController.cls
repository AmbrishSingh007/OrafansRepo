public class MyLeadUpdateController {

    public String SearchItem{get;set;}
    public List<cLead> allLeads=null;
    public static Integer start=0;
    public static Integer ending=1;
    public static Integer B=1;
    public String getData()
    {
        return start+'---'+ending;
    }
    public String getB()
    {
        return '---'+B;
    }
    public void setLeads()//for click on search
    {
        if(SearchItem!=null){
            List<Lead> leads=[select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%'];
            allLeads=new List<cLead>();
            for(Lead alead:leads)
              {
                cLead cL=new cLead(alead);
                allLeads.add(cL);     
                  
              }
            }   
    }
    public List<cLead> getLeads()//for click next
    {System.debug('---getLeads');
        if(allLeads!=null){
            List<cLead> cL=new List<cLead>();
            //if(!start<=allLeads.size()){}
            //if(!ending<=allLeads.size()){}
            for(Integer x=start;x<=ending;x++){
                if(allLeads.get(x)==null)
                    break;
                cL.add(allLeads.get(x));
                }
                return cL;
            }
            return null;  
    }
    public void gotoNext(){
        start+=2;
        ending+=2;       
System.debug('---gotoNext'+start+'  '+ending);
    }
    
public void goto(){
        B+=2;}
    public class cLead{
    public Boolean check{set;get;}
    public Lead l{set;get;}
    cLead( Lead l)
    {
        this.check=false;
        this.l=l;
    }
    
    }
}