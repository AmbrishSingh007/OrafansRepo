public class CloseLeadForCampaign {
public String searchItem{set;get;}
public List<Lead> wrap{set;get;}
public Integer count{set;get;}
public CloseLeadForCampaign(ApexPages.StandardController controller) {

    }
public List<Lead> getWrapData()
{   
List<CampaignMember> capMem=[SELECT CampaignID, LeadID FROM CampaignMember WHERE CampaignID =:ApexPages.CurrentPage().getParameters().get('cid')];
Set<Id> ids=new Set<Id>();
for(CampaignMember camM:capMem)
    ids.add(camM.LeadID);
    
    if(searchItem!=null && !searchItem.equals(''))
        wrap= [select id,name,Company,Status from Lead where Company like : '%'+searchItem+'%' and id in :ids];
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