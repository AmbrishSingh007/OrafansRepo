public class pg3 {

    public pg3(ApexPages.StandardController controller) {

    }
    public ApexPages.StandardSetController con {
        get{
            if(con == null){
                
                con = new ApexPages.StandardSetController([Select id,name from Contact where AccountId=:ApexPages.CurrentPage().getParameters().get('id') offset 2]);//Database.getQueryLocator(queryString));
                con.setPageSize(2);
            }
            return con;
        }set;
    }
    
    public List<Contact> getContacts(){
        List<Contact> conList = new List<Contact>();
        for(Contact a : (List<Contact>)con.getRecords())
            conList.add(a);
        return conList;
    }
    
    /*public pageReference refresh() {
        con = null;
        getAccounts();
        con.setPageNumber(1);
        return null;
    }*/
     
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
        con.next();
    }

}