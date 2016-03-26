public class DataFilter {
public String chooseCategory{set;get;}
public String objName{set;get;}
public List<selectOption> getItems()
    { 
        List<selectOption> options=new List<SelectOption>();
        options.add(new selectOption('Select','Select'));
        options.add(new SelectOption('THIS_WEEK','THIS_WEEK'));
        options.add(new SelectOption('LAST_90_DAYS','LAST_90_DAYS'));
        options.add(new SelectOption('THIS_QUARTER','THIS_QUARTER'));
        options.add(new SelectOption('LAST_QUARTER','LAST_QUARTER'));
        options.add(new SelectOption('THIS_YEAR','THIS_YEAR'));
        return options;
    }
public List<sObject> getData()
{
if(chooseCategory!='Select'  && objName!=null){
    String query='select id,name from '+objName+' where createddate<='+chooseCategory;
    List<sObject> obj=Database.query(query);
    return obj;
    }
    return null;
    
}    

}