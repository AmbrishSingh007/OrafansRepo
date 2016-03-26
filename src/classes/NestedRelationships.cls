public class NestedRelationships {
    public static void relTest()
    {
		List<Parent__c> p=[select Parent__c.id,Parent__c.name, (select Child__c.id,Child__c.name from Parent__c.Children__r) from Parent__c]; 
    	System.debug(p);
        //System.debug('---'+p.Child__r.name);
    }

}