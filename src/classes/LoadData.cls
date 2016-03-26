public class LoadData{
    public static void load(){
        List<TreeTest__c> listTree=new List<TreeTest__c>();
        TreeTest__c tt=null;
        for(Integer i=1;i<10000;i++){
            tt=new TreeTest__c(Name='Node'+i);
            listTree.add(tt);
        }
        insert listTree;
        /*
        Integer j=1;
        List<TreeTest__c> listTree1=new List<TreeTest__c>();
        for(TreeTest__c t:listTree){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree1.add(tt);
        }
        insert listTree1;
        
        j=1;
        List<TreeTest__c> listTree2=new List<TreeTest__c>();
        for(TreeTest__c t:listTree1){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree2.add(tt);
        }
        insert listTree2;
        
        j=1;
        List<TreeTest__c> listTree3=new List<TreeTest__c>();
        for(TreeTest__c t:listTree2){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree3.add(tt);
        }
        insert listTree3;
        
        j=1;
        List<TreeTest__c> listTree4=new List<TreeTest__c>();
        for(TreeTest__c t:listTree3){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree4.add(tt);
        }
        insert listTree4;
        
        j=1;
        List<TreeTest__c> listTree5=new List<TreeTest__c>();
        for(TreeTest__c t:listTree4){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree5.add(tt);
        }
        insert listTree5;
        
        j=1;
        List<TreeTest__c> listTree6=new List<TreeTest__c>();
        for(TreeTest__c t:listTree5){
            tt=new TreeTest__c(Name='Node'+j,parentId__c=t.id);
            j++;
            listTree6.add(tt);
        }
        insert listTree6;
        */
        
    }
    public static void deleteData(){
        //delete [select id from TreeTest__c where name like 'Node%'];
        delete [select id from TreeTest__c];
    }
    public static void loadToUserDate(){
        UserData__c ud=null;
        List<UserData__c> listUData=new List<UserData__c>();
        for(Integer i=10000;i<20000;i++){
            ud=new UserData__c(name='user'+i);
            listUData.add(ud);
        }
        insert listUData;
        
    }
}