@RestResource(urlMapping='/myWeb2/*')
global class MyWebServiceRest {
@HttpGet

@RestResource(urlMapping='*/get1')
webService static Account getName1()
{
    //String str=JSON.serialize([select id,name from Account limit 5]);
    //return [select id,name from Account limit 5];
    
    RestRequest req = RestContext.request;  
    String id1=req.params.get('id');
    //System.debug('---'+req.params.KeySet());      
    String accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    System.debug('---'+req);
    return [select id,name from Account where id =:id1];//00190000013KySP
    
    //---RestRequest:[headers={Accept=*/*, Accept-Encoding=gzip, CipherSuite=AES256-SHA TLSv1 256-bits, Content-Type=text/html; charset=UTF-8, Host=ap1.salesforce.com, User-Agent=Workbench/29.0.8, X-PrettyPrint=true, X-Salesforce-SIP=54.163.85.246}, httpMethod=GET, params={id=00190000013KySP}, remoteAddress=54.163.85.246, requestBody=Blob[0], requestURI=/myWeb2, resourcePath=/services/apexrest/myWeb2/*]
    
    //return 'get1: My name is Ambrish Singh';
    
    /*RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    res.responseBody = blob.valueOf('I am Ambrish Singh');
    */
    //return blob.valueOf('I am Ambrish Singh')+'';

}

@RestResource(urlMapping='*/get2')
webService static List<Student> getName2()
{
    //String str=JSON.serialize([select id,name from Account limit 5]);
    //return [select id,name from Account limit 5];
    //return 'get2: My name is Ambrish Singh';
    List<Student> stu=new List<Student>();
    stu.add(new Student('1','Ambrish'));
    stu.add(new Student('2','Rambo'));
    return stu;
}

@RestResource(urlMapping='/get3')
webService static List<Account> getName3()
{

    return [select id,name from Account limit 5];
}

@HttpPost
webService static String getName()
{
    //String str=JSON.serialize([select id,name from Account limit 5]);
    //return [select id,name from Account limit 5];
    return 'My name is Mr. Singh';

}
global class Student{
String id{get;set;}
String name{get;set;}
public Student(String id, String name){
this.id=id;
this.name=name;
}

}
}