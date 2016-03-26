public class Loading {
    public String searchString{get;set;}
    public List<Account> acc;
    public List<Account> getAcc() {
        acc=new List<Account>();
        search();
        return acc;
    }
    public void search(){
    acc=[select id,name from account where name=:searchString];

}
}