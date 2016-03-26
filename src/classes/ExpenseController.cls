public class ExpenseController {

    

    public MyDate fromDate{get;set;}
    public MyDate toDate{get;set;}
    public Daily_Expense__c de{get;set;}
    public Boolean rendered{set;get;}
    public String total{set;get;}
    public String spentBy{set;get;}

    public ExpenseController(){
    System.debug('---inside ExpenseController');
    fromDate=new MyDate();
    toDate=new MyDate();
    de=new Daily_Expense__c();
    rendered=false;
    spentBy='--None--';
    }
    
    public List<selectOption> getMM()
{
    System.debug('---inside getMM');
    List<selectOption> options=new List<SelectOption>();
    options.add(new selectOption('0','MM'));
    options.add(new selectOption('1','Jan'));
    options.add(new selectOption('2','Feb'));
    options.add(new selectOption('3','Mar'));
    options.add(new selectOption('4','Apr'));
    options.add(new selectOption('5','May'));
    options.add(new selectOption('6','June'));
    options.add(new selectOption('7','July'));
    options.add(new selectOption('8','Aug'));
    options.add(new selectOption('9','Sept'));
    options.add(new selectOption('10','Oct'));
    options.add(new selectOption('11','Nov'));
    options.add(new selectOption('12','Dec'));
    return options;
}
    public List<selectOption> getYY()
{
    System.debug('---inside getYY');
    List<selectOption> options=new List<SelectOption>();
    options.add(new selectOption('0','YY'));
    options.add(new selectOption('2015','2015'));
    options.add(new selectOption('2016','2016'));
    options.add(new selectOption('2017','2017'));
    
    return options;
}
    public List<selectOption> getNames()
{
    System.debug('---inside getNames');
    List<selectOption> options=new List<SelectOption>();
    options.add(new selectOption('--None--','--None--'));
    options.add(new selectOption('Ambrish','Ambrish'));
    options.add(new selectOption('Bijay','Bijay'));    
    return options;
}
    public PageReference save(){
    System.debug('---inside save'+de);
        insert de;
        de=new Daily_Expense__c();
        rendered=true;
        //ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Record Inserted Successfully');
        //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Record Inserted Successfully','MSG2'));
        System.debug('---inside save2'+de);
        return null;
    }
    public List<Daily_Expense__c> getAllData(){
    System.debug('---inside getAllData');
    if(fromDate.mm!=null && !fromDate.mm.equals('0') ){
    date frmDate = date.parse(fromDate.mm+'/1/'+fromDate.yy);
    date toDate = date.parse(toDate.mm+'/1/'+toDate.yy);
    
    if(spentBy.equals('--None--')){
    total=[select sum(Amount__c) from Daily_Expense__c where Date__c>=:frmDate  and Date__c<=:toDate].get(0).get('expr0')+'';
    return [select Spent_By__c,Date__c,Amount__c,Description__c from Daily_Expense__c where Date__c>=:frmDate  and Date__c<=:toDate ];}
    else{
    total=[select sum(Amount__c) from Daily_Expense__c where Date__c>=:frmDate  and Date__c<=:toDate and Spent_By__c=:spentBy].get(0).get('expr0')+'';
    return [select Spent_By__c,Date__c,Amount__c,Description__c from Daily_Expense__c where Date__c>=:frmDate  and Date__c<=:toDate and Spent_By__c=:spentBy];}
    }
    else{
    if(spentBy.equals('--None--')){
    total=[select sum(Amount__c) from Daily_Expense__c].get(0).get('expr0')+'';
    return [select Spent_By__c,Date__c,Amount__c,Description__c from Daily_Expense__c ];}
    else{
    total=[select sum(Amount__c) from Daily_Expense__c where Spent_By__c=:spentBy].get(0).get('expr0')+'';
    return [select Spent_By__c,Date__c,Amount__c,Description__c from Daily_Expense__c where Spent_By__c=:spentBy];}
    }
    
    }
    /*public List<Daily_Expense__c> filterSearch()
    {
        total=[select sum(Amount__c) from Daily_Expense__c].get(0).get('expr0')+'';
        return [select Spent_By__c,Date__c,Amount__c,Description__c from Daily_Expense__c where Date__c>=:d.fromDate and Date__c<=:d.toDate];
    }*/
    
    public class MyDate{
        public String dd{get;set;}
        public String mm{get;set;}
        public String yy{get;set;}
    }
    
}