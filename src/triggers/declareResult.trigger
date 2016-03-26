trigger declareResult on Marks__c (before insert,before update) {
    Marks__c marks=trigger.new.get(0);
    Studentt__c stu=[select id,result__c from Studentt__c where id=:marks.Studentt__c limit 1];
    if(marks.Maths__c>=40 && marks.English__c>=40){
        stu.result__c='Passed';
        }
    else
        stu.result__c='Failed';
        
        update stu;

}