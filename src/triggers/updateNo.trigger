trigger updateNo on Student__c (after insert,after update,before delete,after undelete) {
List<School__c> toUpdate=null;//new List<School__c>();
Set<id> ids=new Set<id>();



if(Trigger.isInsert || Trigger.isUndelete)
{    
    for(Student__c s:trigger.new)
    {
        ids.add(s.SchoolName__c);
    } 
    toUpdate=[select id,name,Number_Of_Students__c from School__c where id =:ids];
    for(School__c s:toUpdate)
        s.Number_Of_Students__c+=1;
    update toUpdate;
       
}
if(Trigger.isDelete)
{
    for(Student__c s:trigger.old)
    {
        ids.add(s.SchoolName__c);
    } 
    toUpdate=[select id,name,Number_Of_Students__c from School__c where id =:ids];
    for(School__c s:toUpdate)
        s.Number_Of_Students__c-=1;
    update toUpdate;
}

if(trigger.isUpdate)
{
    Set<id> ids2=new Set<id>();
    List<School__c> toUpdate2=null;
    for(Student__c s:trigger.new)
    {
        ids.add(s.SchoolName__c);
        ids2.add(Trigger.oldMap.get(s.id).SchoolName__c);
        System.debug('---'+Trigger.oldMap.get(s.id).SchoolName__c+' '+s.id);
    }
    toUpdate=[select id,name,Number_Of_Students__c from School__c where id =:ids];
    toUpdate2=[select id,name,Number_Of_Students__c from School__c where id =:ids2];
    Map<id,School__c> mm=new Map<id,School__c>();//(select id,name,Number_Of_Students__c from School__c where id =:ids2); 
    for(School__c ss:toUpdate2)
        mm.put(ss.id,ss);
    for(School__c ss1:toUpdate)
    {
        //mm.get(ss1.id).Number_Of_Students__c-=1;
        ss1.Number_Of_Students__c+=1;
        
    }
    List<School__c> toUpdate3=new List<School__c>();
    for(id i:mm.keyset())
    {
        mm.get(i).Number_Of_Students__c-=1;
         toUpdate3.add(mm.get(i));
    }
    update toUpdate;
    update toUpdate3;
    
}




}