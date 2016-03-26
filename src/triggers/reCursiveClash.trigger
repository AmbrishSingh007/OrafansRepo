trigger reCursiveClash on Farzi__c (before insert)//,before update)
 {
    System.debug('---inside Trigger');
    trigger.new.get(0).Number__c=15;
}