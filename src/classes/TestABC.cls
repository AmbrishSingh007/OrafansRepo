@isTest
public class TestABC{
    static testMethod void vWorld() {
        Schema.DescribeSObjectResult R = Farzi__c.SObjectType.getDescribe();
        List<Schema.RecordTypeInfo> RT = R.getRecordTypeInfos();
        //id i=Schema.SObjectType.GSD_Resource__c.RecordTypeInfosByName.get('RecType1').RecordTypeId;
        System.debug('===>>>'+RT);
    }
}