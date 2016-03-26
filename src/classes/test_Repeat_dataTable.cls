public class test_Repeat_dataTable {
    public List<Account> getStrings() {
        return [select id,name from Account limit 5];
    }

}