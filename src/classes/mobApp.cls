public class mobApp {
public Integer i{get;set;}
public Integer size{get;set;}
public List<Product__c> products=new List<Product__c>();
public mobApp()
{
    i=0;
    products=[select id,name,Category__c,Description__c,Image__c,Vendor__c from Product__c];
    size=products.size();
} 
public Product__c getData()
{
    return products.get(i);
}
public void increment() {
        i++;
        i=math.mod(i,size);
}

}