trigger checkSysAdmin on Contact (before insert,before update) {
Set<id> ids=new Set<id>();
Map<Id,User> userProfs=null;
Map<Id,Profile> Profs=null;
Set<id> profIds=new Set<id>();
for(Contact c:trigger.new)
    ids.add(c.ownerId);
userProfs=new Map<Id,User>([select id,ProfileId from User where id in :ids]);    
for(Id uId:userProfs.keySet())
    profIds.add(userProfs.get(uId).ProfileId);
Profs=new Map<Id,Profile>([select id,Name from Profile where id in :profIds]);
for(Contact c:trigger.new)
{
//Id pId=[select ProfileId from User where id=:UserInfo.getUserId()].ProfileId;
//String  pName=[select Name from Profile where id=:pId].Name;
if(Profs.get((userProfs.get(c.ownerId)).ProfileId).name.equals('System Administrator'))
    c.Non_System_Admin_Case__c=true;
else
    c.Non_System_Admin_Case__c=false;   
}
}