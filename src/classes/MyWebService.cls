@RestResource(urlMapping='/myWeb')
global class MyWebService {
@HttpPost
webService static String getName() 
{
    /*RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;
    res.responseBody = blob.valueOf('I am Ambrish Singh');
    */
    return '---Hellboy';
    

}
@HttpGet
webService static String getName2() //List<Account>
{
    String str=JSON.serialize([select id,name from Account limit 5]);
    //return [select id,name from Account limit 5];
    return str;

}
}