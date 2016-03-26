public class TreeData {
    public static String str='';
    public static String str1='';
    Map<id,TreeTest__c> allNodes=new Map<id,TreeTest__c>([select id,Name,parentId__c from TreeTest__c limit 50000]);
    Map<Id,List<TreeTest__c>> mappedNodes=new Map<Id,List<TreeTest__c>>();
    public String getPushData() {
    System.debug('==='+allNodes);
    for(TreeTest__c acc:allNodes.values()){
        List<TreeTest__c> lAcc=mappedNodes.get(acc.parentId__c);
        if(lAcc!=null)
            lAcc.add(acc);
        else{
            lAcc=new List<TreeTest__c>();
            lAcc.add(acc);
            mappedNodes.put(acc.parentId__c,lAcc);
        }
    }
    System.debug('---'+mappedNodes);
    for(TreeTest__c a:mappedNodes.get(null)){
        str='<ul id="example2">';
            str+=recur(a);
        str+='</ul>';
    }
    System.debug('---::'+str);
    return str;
        //return '<ul id="example2"><li><a href="/a0M9000000EwWWX">click</a><ul><li>Home Page</li></ul></li><li>Academics<ul><li>Time Table</li><li>Attendence<li>Mark<ul><li>Maths</li><li>English</li><li>Chemistry</li><li>Hindi</li></ul></li><li>Rectification Request</li><li>View Rectification Status</li></li></ul></li></ul>'; 

    }
    public String recur(TreeTest__c TreeTest){
    
        str1+='<li>'+'<a href="/'+TreeTest.id+'" target="_blank">'+TreeTest.Name+'</a>';
        //str1+='<li>'+TreeTest.Name;
            List<TreeTest__c> acc=mappedNodes.get(TreeTest.id);
            if(acc!=null){
            str1+='<ul>';
                for(TreeTest__c a:acc){
                //str1+='<li>'+a.Name;
                    recur(a);
                //str1+='</li>';
                    }
            str1+='</ul>';
                }
        str1+='</li>';
        System.debug('---'+str1);
        return str1;
    }

public String data{set;get;}
public TreeData(){
    data='It\'s done';
    System.debug('---Constructor');
}
public void pushData(){
    data='It\'s done';
    System.debug('---pushData');
}

}