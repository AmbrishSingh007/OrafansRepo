public with sharing class AccountUpdateIntegration {

    @future (callout=true) 
    public static void runjob(String username, String password, String jobName, String jobType) {
        System.debug('---runjob Started');
        testOtherMethods();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http(); 

        req.setEndpoint('https://app.informaticaondemand.com/saas/api/1/runjob?username='+EncodingUtil.urlEncode(username, 'UTF-8')+
                           '&password='+EncodingUtil.urlEncode(password, 'UTF-8')+
                           '&jobName='+EncodingUtil.urlEncode(jobName, 'UTF-8')+
                           '&jobType='+EncodingUtil.urlEncode(jobType, 'UTF-8'));
        req.setMethod('POST');

        try
        {
            System.debug('---In Try');
            res = http.send(req);
            System.debug('---In Try'+res);
        }
        catch(System.CalloutException e)
        {
            System.debug('---Job Error: '+ e);
            System.debug(res.toString());
        }
    }
    public static void testOtherMethods(){
        System.debug('---testOtherMethods()');
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http(); 

        /*req.setEndpoint('https://app.informaticaondemand.com/saas/api/1/login'+
        '?sfSessionId='+UserInfo.getSessionId()+'&sfServerUrl=https://www.salesforce.com/services/Soap/u/31.0&responseType=xml');
        */
        
        req.setEndpoint('https://app.informaticaondemand.com/saas/api/1/login?username=orafans999@gmail.com'+
                           '&password=alteclansing1950');
        req.setMethod('POST');
        try
        {
            System.debug('---Test In Try');
            res = http.send(req);
            System.debug('---Test In Try'+res+'----'+res.getBody());
        }
        catch(System.CalloutException e)
        {
            System.debug('---Test Error: '+ e);
            System.debug(res.toString()+'----'+res.getBody());
        }
    }
}