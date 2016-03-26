public class DynamicBinding {
    
    public sObject sObjectToBind {get;set;}
    public List<String> listObjectFields {get;set;}
    
    public List<Field> listObjectFields1 {get;set;}
        
    public DynamicBinding()
    {
        listObjectFields1 =  new List<Field>();
        
        listObjectFields =  new List<String>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        //Account sObjType = new Account();//globalDescription.get('Account');   Schema.sObjectType
        Schema.sObjectType sObjType =globalDescription.get('Account');
        
        sObjectToBind = sObjType.newSObject();
        Schema.DescribeSObjectResult r1 = sObjType.getDescribe();
        
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();
            
            listObjectFields1.add(new Field('Name',true,true));
            listObjectFields1.add(new Field('Type',true,true));
            listObjectFields1.add(new Field('active__c',false,true));
            listObjectFields1.add(new Field('AccountNumber',true,true));
            
            sObjectToBind.put('Type','Prospect');
            sObjectToBind.put('active__c','Yes');
            
            
                        
    }
    public void saveData(){
            listObjectFields1.clear();
            listObjectFields1.add(new Field('Type',true,true));
            listObjectFields1.add(new Field('active__c',false,true));
            listObjectFields1.add(new Field('AccountNumber',true,true));
        System.debug('sObjectToBind:: '+sObjectToBind);
        //insert sObjectToBind ;
        System.debug('sObjectToBind:: '+sObjectToBind);
    }
    public class Field{
    public String apiName{set;get;}
    public Boolean mandatory{set;get;}
    public Boolean visible{set;get;}
    Field(String apiName,Boolean mandatory,Boolean visible){
    this.apiName=apiName;
    this.mandatory=mandatory;
    this.visible=visible;
    }
    }
}