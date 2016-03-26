public class FieldCreator{
    public sObject sObjectToBind {get;set;}
    public FieldCreator(ApexPages.StandardController controller) {

    }
    public Case myOwnCase{set;get;}
    public FieldCreator(){
        myOwnCase=new Case();
    }
    static Field[] popFields=new Field[]{new Field('Subject',false,true),new Field('Type',false,true)};
    static Field[] trustFields=new Field[]{new Field('Coverage__c',true,true),new Field('CSR_Part_Order_Count__c',false,true)};
    public static List<Field> getFields(String arg){
    List<Field> fields=new List<Field>();
    if(arg.equals('POP'))
        fields.addAll(popFields);
    else if(arg.equals('TRUST'))
        fields.addAll(trustFields);
    else
        return null;
    return fields;
    }
    
    public class Field{
    String apiName{set;get;}
    public Boolean mandatory{set;get;}
    public Boolean visible{set;get;}
    Field(String apiName,Boolean mandatory,Boolean visible){
    this.apiName=apiName;
    this.mandatory=mandatory;
    this.visible=visible;
    }
    }
    public Component.Apex.OutputPanel getpanel1()
    {
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        Schema.sObjectType sObjType =globalDescription.get('Case');
        sObjectToBind = sObjType.newSObject();
        
        Component.Apex.OutputPanel outPanel = new Component.Apex.OutputPanel();
        Component.Apex.Form form1=new Component.Apex.Form(id='form1');
        List<Field> fields=getFields('POP');
        Component.Apex.InputField field=null;
        outPanel.childComponents.add(form1);
        //Component.Apex.OutputLabel ol1=new Component.Apex.OutputLabel(value='Ambrish Kumar Singh');
        
        for(Field f:fields){
        field=new Component.Apex.InputField();
        field.expressions.value = '{!Case.'+Schema.SobjectType.Case.fields.getMap().get(f.apiName)+'}';// 
        field.required=f.mandatory;
        field.rendered=f.visible;//'{!'+f.visible+'}';
        form1.childComponents.add(field);
        form1.childComponents.add(new Component.Apex.OutputLabel(value='{!'+f.apiName+'}'));
        form1.childComponents.add(new Component.Apex.OutputLabel(value='{!'+f.mandatory+'}'));
        
        System.debug('---'+myOwnCase);
        System.debug('---'+Schema.SobjectType.Case.fields.getMap().get(f.apiName));
        }
        Component.Apex.CommandButton cmd=new Component.Apex.CommandButton();
        cmd.value='SaveCase';
        cmd.expressions.action='{!saveCase}';
        form1.childComponents.add(cmd);
        //form1.childComponents.add(ol1);
        return outPanel;
    }
    public void saveCase(){
    System.debug('---saveCase'+sObjectToBind);
    insert sObjectToBind;
    }
}