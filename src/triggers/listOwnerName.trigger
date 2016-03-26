trigger listOwnerName on Lead (before insert,before update) {
for(Lead l:Trigger.new){
    if(Trigger.isInsert && l.ownerId!=null)
    {
        l.Description=l.ownerId;
    }
    else if(Trigger.isUpdate)
    {
        if(Trigger.oldMap.get(l.id).ownerId!=Trigger.newMap.get(l.id).ownerId){
        l.Description=l.Description+', '+l.ownerId;
        }
    }
    }

}