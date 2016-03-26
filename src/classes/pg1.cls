public class pg1 {
    public List<ContactsWrap> wrapCon=new List<ContactsWrap>();
    public List<ContactsWrap> selectedContacts=new List<ContactsWrap>();
    public Map<String,ContactsWrap> selConsMap{get{
    if(selConsMap==null)
        selConsMap=new Map<String,ContactsWrap>();
    return selConsMap;
    }
    set;}
    public List<ContactsWrap> getWrapCon(){
    if (wrapCon==null)
        getContacts();
    return wrapCon;
    }
    public String parameter{set;get;}
    public pg1(ApexPages.StandardController controller) {

    }
    public List<ContactsWrap> getSelData(){
    return selConsMap.values();
    }
    public ApexPages.StandardSetController con {
        get{
        System.debug('---Inside set con');
            if(con == null){
            System.debug('---Inside con==null');
                //string queryString = 'Select id,name from Contact';//+ApexPages.CurrentPage().getParameters().get('id');
                //con = new ApexPages.StandardSetController([Select id,name from Contact where AccountId='0019000000twDIe']);//:ApexPages.CurrentPage().getParameters().get('id')]);//Database.getQueryLocator(queryString));
                List<Account> l=[Select id,name from Account ];//where AccountId='0019000000twDIe'
                con = new ApexPages.StandardSetController(l);//:ApexPages.CurrentPage().getParameters().get('id')]);//Database.getQueryLocator(queryString));
                con.setPageSize(5);
                //getContacts();
            }
            return con;
        }set;
    }
    
    public List<ContactsWrap> getContacts(){
    System.debug('---Inside getContacts');
    wrapCon.clear();
        //List<Contact> conList = new List<Contact>();
        for(Account a : (List<Account>)con.getRecords())
            {//conList.add(a);
                if(selConsMap.get(a.id)==null)
                    wrapCon.add(new ContactsWrap(false,a));
                else
                    wrapCon.add(new ContactsWrap(true,a));
            }
        return wrapCon;
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
    System.debug('---Inside Previous');
        next_prev();
        con.previous();
    }
  
    public void next() {
        System.debug('---Inside Next');
        next_prev();
        con.next();
    }
    class ContactsWrap{
    public ContactsWrap(boolean s,Account x)
    {
        selected=s;
        c=x;
    }
    public boolean selected{set;get;}
    public Account c{set;get;}
    }
    public PageReference redirect()//PageReference
    {
        next_prev();
        return Page.Pagination_SelectedData;
    }
    public void next_prev(){
        System.debug('---Inside Next Prev');
        for(ContactsWrap cw:wrapCon)
            { System.debug('---Inside for of Next');
                if(selConsMap.get(cw.c.id)!=null){
                    if(cw.selected==true )
                        selConsMap.put(cw.c.id,cw);
                    else
                        selConsMap.remove(cw.c.id);
                    System.debug('---Inside for of Next---'+cw.c.name);
                    }
                else{
                System.debug('---Inside for of Next---'+cw.c.name);
                    if(cw.selected==true )
                        selConsMap.put(cw.c.id,cw);
                }    
            }
    }
}