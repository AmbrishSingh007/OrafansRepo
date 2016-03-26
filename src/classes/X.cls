public class X {
public String data{set; get;}
public Map<String,List<Schema.PicklistEntry>> pLists{set;get;}
public Map<String,String> dDatas{set;get;}

public List<String> ll{set;get;}
public List<ObjectForm> ll1{set;get;}
public List<String> lists{set;get;}
public Integer length{get;set;}
public X()
{
    pLists=new Map<String,List<Schema.PicklistEntry>>();
    dDatas=new Map<String,String>();
    ll=new List<String>();  
    ll1=new List<ObjectForm>(); 
    lists=new List<String>();
      
    Schema.DescribeFieldResult fieldResult = Farzi__c.multi__c.getDescribe();
    Map<String,Schema.SObjectField> fields=Schema.sObjectType.Farzi__c.fields.getMap();
    length=0;
    for(String c:fields.keySet()){
        //System.debug('!!!'+Schema.sObjectType.Farzi__c.fields.getMap().get(c));
        if(fields.get(c).getDescribe().getType()+''==('MULTIPICKLIST')){
        Schema.DescribeFieldResult fieldResult1 = fields.get(c).getDescribe(); 
        List<Schema.PicklistEntry> ple1 = fieldResult1.getPicklistValues();
        String str='{"name":"'+fields.get(c)+'","values":"';
            for(Schema.PicklistEntry p:ple1){
                str+=p.getValue()+';';
                System.debug('---'+p.getValue());
           
            }
            str+='"}';
            System.debug(str);
            lists.add(str);
            length++;
            }
        }
        
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    for(Schema.PicklistEntry p:ple){
        //System.debug('---'+p.getValue());
        data=data+';'+p.getValue();
        }
        System.debug(data);
    
    ll.add(getMappedData('multi__c',Farzi__c.multi__c.getDescribe()));
    ll.add(getMappedData('multi1__c',Farzi__c.multi1__c.getDescribe())); 
    
    ll1.add(new ObjectForm('multi__c',Farzi__c.multi__c.getDescribe()));
    ll1.add(new ObjectForm('multi1__c',Farzi__c.multi1__c.getDescribe()));

    //dDatas.put('multi__c',getMappedData(Farzi__c.multi__c.getDescribe()));
    //dDatas.put('multi1__c',getMappedData(Farzi__c.multi1__c.getDescribe()));        
/*        
    Map<String,Schema.SObjectType> gd=Schema.getGlobalDescribe();  
    List<Schema.DescribeFieldResult> fieldMetadata=new List<Schema.DescribeFieldResult>();
    Map<String,Schema.SObjectField> objFields = gd.get('Farzi__c').getDescribe().fields.getMap();
    for(String k:objFields.keySet()){
        fieldMetadata.add(objFields.get(k).getDescribe());
        System.debug('***'+objFields.get(k).getDescribe());
        //Schema.DisplayType type=new Schema.DisplayType(MULTIPICKLIST);        
        if((objFields.get(k).getDescribe().getType()+'')==('MULTIPICKLIST'))
         {System.debug('***A'+objFields.get(k).getDescribe().getName());
             String name=objFields.get(k).getDescribe().getName();         
             pLists.put(name,Farzi__c.name.getDescribe().getPicklistValues());  
              //System.debug('==='+Farzi__c.name.getDescribe().getPicklistValues());   
               for(Schema.PicklistEntry p:Farzi__c.name.getDescribe().getPicklistValues()){
                System.debug('---'+p.getValue());
                //data=data+';'+p.getValue();
                }
 
         } 
    } 
*/       
}
public String getMappedData(String str,Schema.DescribeFieldResult fieldResult)
{
    String d=str+':"';
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    for(Schema.PicklistEntry p:ple){
        d=d+';'+p.getValue();
        }
    return d+'"';        

}
public class ObjectForm{
String name{set;get;}
String values{set;get;}
public ObjectForm(String name,Schema.DescribeFieldResult fieldResult){
this.name=name;

String d='';
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    for(Schema.PicklistEntry p:ple){
        d=d+';'+p.getValue();
        }
    d+='"';
this.values=d;
}
}
}