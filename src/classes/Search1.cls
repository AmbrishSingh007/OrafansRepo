public class Search1 {
    public List<Contact> getData() {
    List<Contact> con=null;
    String str=ApexPages.CurrentPage().getParameters().get('id');
    String query='';
    if(Name!='' && Email!='')
         query='select id,name from Contact where AccountId=:str and email=:email and name=:name';
    else if(Name!='')
         query='select id,name from Contact where AccountId=:str and name=:name';
    else if(Email!='')
        query='select id,name from Contact where AccountId=:str and email=:email';
    else
        return null;
            
        con=Database.query(query);
     return con;
    }
    public String Name{set; get;}
    public String Email{set; get;}
    


}