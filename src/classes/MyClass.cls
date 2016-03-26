public class MyClass
{
public String objName{set;get;}
public String date1{get;set;}
public Date d{get;set;}
public Map<String,Schema.SObjectType> gd;//=new Map<String,Schema.SObjectType>();

public MyClass()
{   
/*
date1='01-09-2014';
    date1='15-09-2014';
    String[] parts=date1.split('-');
    String newDate=parts[2]+'-'+parts[1]+'-'+parts[0];
    date1=newDate;
    d=Date.valueOf(date1);
    d=Date.valueOf(newDate); 
    */
    gd = Schema.getGlobalDescribe();
    System.debug('Inside Constructor');
}
public List<selectOption> getObjects()
{
    List<selectOption> listObjs=new List<selectOption>();
    listObjs.add(new selectOption('Select Object','Select Object'));
    for(String key:gd.keySet())
    {
        //if(key.contains('account'))
            listObjs.add(new selectOption(key,key));
    }
    return listObjs;
}

public List<Schema.DescribeFieldResult> getFields()
{
    System.debug('---Inside getFields()'+objName);
    List<Schema.DescribeFieldResult> fieldMetadata=new List<Schema.DescribeFieldResult>();
    if(objName!=null && objName!='Select Object'){
    Map<String,Schema.SObjectField> objFields = gd.get(objName).getDescribe().fields.getMap();
    System.debug('---Inside getFields() If'+objFields);
    for(String k:objFields.keySet())
        fieldMetadata.add(objFields.get(k).getDescribe());
    return fieldMetadata;//gd.get(objName).getDescribe().fields.getMap().keySet();
    }
    return null;
}
public Schema.DescribeSObjectResult getObjectData()
{
    if(objName!=null && objName!='Select Object'){
        Schema.DescribeSObjectResult objData = gd.get(objName).getDescribe();
        return objData;//gd.get(objName).getDescribe().fields.getMap().keySet();
    }
    return null;
}
public String getSobjectFields()   
{  
       
     Schema.SObjectType sobjType = gd.get('Account');  
     Schema.DescribeSObjectResult r = sobjType.getDescribe();  //get full description on object eg isDeletable,etc.
     /*Schema.DescribeSObjectResult[getKeyPrefix=001;getLabel=Account;getLabelPlural=Accounts;getName=Account;isAccessible=true;
     isCreateable=true;isCustom=false;isCustomSetting=false;isDeletable=true;isDeprecatedAndHidden=false;isFeedEnabled=true;isMergeable=true;
     isQueryable=true;isSearchable=true;isUndeletable=true;isUpdateable=true;*/
     Map<String,Schema.SObjectField> M = r.fields.getMap(); //to get Account Fields
     
     System.debug('***'+r);

     for(String f : M.keyset())  
        {  
            System.debug(f+'---'+M.get(f)+'###'+M.get(f).getDescribe().getByteLength());//get metadata about field
            /*Phone###Schema.DescribeFieldResult[getByteLength=120;getCalculatedFormula=null;getController=null;getDefaultValue=null;
            getDefaultValueFormula=null;getDigits=0;getInlineHelpText=null;getLabel=Account Phone;getLength=40;getLocalName=Phone;getMask=null;
            getMaskType=null;getName=Phone;getPrecision=0;getRelationshipName=null;getRelationshipOrder=null;getScale=0;getSoapType=STRING;
            getSobjectField=Phone;getType=PHONE;isAccessible=true;isAutoNumber=false;isCalculated=false;isCascadeDelete=false;isCaseSensitive=false;
            isCreateable=true;isCustom=false;isDefaultedOnCreate=false;isDependentPicklist=false;isDeprecatedAndHidden=false;isDisplayLocationInDecimal=false;
            isExternalId=false;isFilterable=true;isGroupable=true;isHtmlFormatted=false;isIdLookup=false;isNameField=false;isNamePointing=false;isNillable=true;
            isPermissionable=true;isQueryByDistance=false;isRestrictedDelete=false;isSortable=true;isUnique=false;isUpdateable=true;
            isWriteRequiresMasterRead=false;]
            */

        } 

        
        
    List<Schema.SObjectType> gd2 = Schema.getGlobalDescribe().Values();  //to get all object names  
    for(Schema.SObjectType f : gd2)
    {
       System.debug('^^^'+f.getDescribe().getLabel());
    }

     return 'Success'; 
 
}
public void storeData(){
    List<ObjectData__c> data=new List<ObjectData__c>();
    List<String> listObjs=new List<String>();
    
    for(String key:gd.keySet())
    {
        ObjectData__c obj=null;
        if(gd.get(key)!=null){
        
        List<Schema.DescribeFieldResult> fieldMetadata=new List<Schema.DescribeFieldResult>();
        Map<String,Schema.SObjectField> objFields = gd.get(key).getDescribe().fields.getMap();
        for(String k:objFields.keySet()){
            obj=new ObjectData__c();
            //fieldMetadata.add(objFields.get(k).getDescribe());
            obj.name=key;
            obj.SobjectField__c=objFields.get(k).getDescribe().getSobjectField()+'';
            obj.Type__c=objFields.get(k).getDescribe().getType()+'';
            obj.ByteLength__c=objFields.get(k).getDescribe().getByteLength();
            
            
            }
            data.add(obj);
           } 
    }
    insert data;
    
}
public void del()
{
delete [select id,name from ObjectData__c];
}
public void displayField()
{
List<ObjectData__c> data=new List<ObjectData__c>();
       for(String key:gd.keySet())
       {
       
       ObjectData__c obj=null;
       Map<String,Schema.SObjectField> objFields = gd.get(key).getDescribe().fields.getMap();
        for(String k:objFields.keySet()){
            obj=new ObjectData__c();
            //fieldMetadata.add(objFields.get(k).getDescribe());
            obj.name=key;
            obj.SobjectField__c=objFields.get(k).getDescribe().getSobjectField()+'';
            obj.Type__c=objFields.get(k).getDescribe().getType()+'';
            obj.ByteLength__c=objFields.get(k).getDescribe().getByteLength();
            System.debug(obj.name+'---'+obj.SobjectField__c+'---'+obj.Type__c+'---'+obj.ByteLength__c);
            data.add(obj);
            }
            }
            insert data;
}
public class FieldsData{
    
}
public void TestDebug()
{
    Schema.DescribeSObjectResult dsr = Account.sObjectType.getDescribe();
    System.debug('---'+dsr);
}
}