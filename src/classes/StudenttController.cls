public class StudenttController {
public String id{set;get;}
public Marks__c getDetails(){
if(id==null)
    return null;
return [select English__c,Maths__c,id from Marks__c where Studentt__c=:id];
}
}