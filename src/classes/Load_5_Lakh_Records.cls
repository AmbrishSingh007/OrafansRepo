public class Load_5_Lakh_Records{
    public void loadRecords(){
    Set<Id> ids=new Set<Id>();
    Map<Id,UserData__c> mapData=new Map<Id,UserData__c>([select id,name from UserData__c limit 50000]);
    //for(Integer 
    }
}