trigger Assignment on Farzi__c (after insert,after update) {

    List<Farzi__Share> jobShares  = new List<Farzi__Share>();

    String USerID ='';

    String ParentID ='';

   

    for(Farzi__c t:trigger.new)

    {

        if(trigger.isInsert){

        Farzi__Share share=new Farzi__Share();

        share.ParentId = t.Id;

        share.UserOrGroupId = t.User__c;

        share.AccessLevel = 'read';

        share.RowCause = Schema.Farzi__Share.RowCause.Reason__c;

        jobShares.add(share);

        }

       

        if(trigger.isUpdate){

        USerID  = Trigger.OldMap.get(t.id).User__c;

        ParentID = t.id;         

        Farzi__Share share=new Farzi__Share();

        share.ParentId = t.Id;

        share.UserOrGroupId = t.User__c;

        share.AccessLevel = 'read';

        share.RowCause = Schema.Farzi__Share.RowCause.Reason__c;

        jobShares.add(share);

        }

       

    }

     Database.SaveResult[] jobShareInsertResult = Database.insert(jobShares,false);

    delete [select id from Farzi__Share where UserOrGroupId=:USerID AND ParentID =:ParentID];

 

}