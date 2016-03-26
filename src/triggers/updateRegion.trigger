trigger updateRegion on Lead (before insert, before update) {
Map<String,Region_setting1__c> allRegions=Region_setting1__c.getAll();
for(Lead l:trigger.new)
{
//System.debug(l.country__c+'---'+allRegions.keyset());
    if(trigger.IsInsert)
    {
    if(l.country__c!=null)
        l.Region__c=allRegions.get(l.country__c).region__c;
    }
    else if(trigger.IsUpdate)
    {
        if(l.country__c!=null && trigger.oldMap.get(l.id).country__c!=trigger.newMap.get(l.id).country__c)
        l.Region__c=allRegions.get(l.country__c).region__c;
    }
}    
}