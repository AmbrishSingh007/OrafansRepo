public class Acc {
Account acc=null;
public Acc(){
    String i=ApexPages.currentPage().getParameters().get('abc');
    acc=[select id,name,active__c from Account where id=:i limit 1];
    name=acc.name;
    active=acc.active__c;
}
public String name{get;set;}
public String active{get;set;}
public void UpdateAcc(){
    acc.name=name;
    acc.active__c=active;
    update acc;
    Contact con=new Contact(LastName='Singh',AccountId=acc.id);
    insert con;
}
}