public class RunJob{
    private string icSessionID = '';
private string icServerURL = '';
private string icErrorMessage = '';
      
public PageReference startInformaticaTaskV2() {
        string loginResult = '';
        string runJobResult = '';
         
        System.debug('---startInformatica');
        loginInformaticaTaskV2();
        if(icErrorMessage <> ''){
        System.debug('---inside if with Error');
            //ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, icErrorMessage);
            //ApexPages.addMessage(msg);
            return null;
        }else{
            //Now make call to start job
            System.debug('---inside else to start job');
            runInformaticaTaskV2();
            System.debug('---after job end');
            if(icErrorMessage <> ''){
                //ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, loginResult);
                //ApexPages.addMessage(msg);
                return null;
            }else{
                return null;//backToXCListView();
            }          
        }
 }
 
public void loginInformaticaTaskV2() {
System.debug('---In login');
        String userName = '';
        String password = '';
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();    
                  
        //if (Informatica_Details__c.getInstance('InformaticaDetails1') != null) {   
            userName = 'orafans999@gmail.com';//Informatica_Details__c.getInstance('InformaticaDetails1').UserName__c;
            password = 'alteclansing1950';//Informatica_Details__c.getInstance('InformaticaDetails1').Password__c;
        //}
  
        req.setEndPoint('https://app.informaticaondemand.com/ma/api/v2/user/login');
        req.setHeader('HTTP', '1.0');
        req.setHeader('Content-Type', 'application/xml');
        req.setHeader('Accept', 'application/xml');
        req.setBody('<login><username>' + userName + '</username><password>' + password + '</password></login>');                          
        req.setMethod('POST');
                 
        try {
            System.debug('---In try');
            res = http.send(req);
            
            if(res.getBody().contains('<icSessionId>')){
                icSessionId = getValueFromXMLString(res.getBody(), 'icSessionId');
                icServerUrl = getValueFromXMLString(res.getBody(), 'serverUrl');
            }else{
                icErrorMessage = res.getBody();
            }          
        } catch(Exception e) {             
            icErrorMessage = e + ' - Response: ' + res.ToString();
        }   
        System.debug('---icSessionId '+icSessionId+'---icServerUrl'+icServerUrl);
        System.debug('---Response'+res+'---'+res.getBody());                   
}
 
public static string getValueFromXMLString(string xmlString, string keyField){
        string valueFound = '';
        if(xmlString.contains('<' + keyField + '>') && xmlString.contains('</' + keyField + '>')){
            try{
                valueFound = xmlString.substring(xmlString.indexOf('<' + keyField + '>') + keyField.length() + 2, xmlString.indexOf('</' + keyField + '>'));   
            }catch (exception e){
                system.debug('Error in getValueFromXMLString.  Details: ' + e.getMessage() + ' keyfield: ' + keyfield);
            }           
        }
        return valueFound;
 }
 
 public void runInformaticaTaskV2() {
         System.debug('---In RunTask');
        String taskID = '';
        String jobType = '';
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();    
                  
        //if (Informatica_Details__c.getInstance('InformaticaDetails1') != null) {   
            taskID = '0012FJ0I000000000003';//Informatica_Details__c.getInstance('InformaticaDetails1').XCTaskId__c;
            jobType = 'DSS';//Informatica_Details__c.getInstance('InformaticaDetails1').XCJobType__c;
        //}
  
        req.setEndPoint(icServerURL + '/api/v2/job');
        req.setHeader('HTTP', '1.0');
        req.setHeader('Content-Type', 'application/xml');
        req.setHeader('Accept', 'application/xml');
        req.setHeader('icSessionId', icSessionId);
        /*Type of task or taskflow. Use one of the following options:-
            AVS. Contact Validation task.-
            DLS. Data loader task.-
            DMASK. Data masking task.-
            DQA. Data assessment task.-
            DRS. Data replication task.-
            DSS. Data synchronization task.-
            MTT. Custom integration task.-
            PCS. PowerCenter task.-
            Workflow. Task flow.-
            DNB_WORKFLOW. D&B360 workflow.
        */
        req.setBody('<job>' + '<taskId>' + taskID + '</taskId>' + '<taskType>' + jobType + '</taskType>' + '</job>');
                             
        req.setMethod('POST');
                 
        try {
            res = http.send(req);
            System.debug('---Response Job');
            //If successful there will be no response
            if(res.getBody() <> ''){
                icErrorMessage = res.getBody();
            }
        } catch(Exception e) {             
            icErrorMessage = e + ' - Response: ' + res.ToString();
        } 
        System.debug('---Response Job'+res); 
        logout();                        
}
public void logout()
{
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http(); 
        
        req.setEndPoint(icServerURL + '/api/v2/user/logout');
        req.setHeader('HTTP', '1.0');
        req.setHeader('Content-Type', 'application/xml');
        req.setHeader('Accept', 'application/xml');
        req.setHeader('icSessionId', icSessionId);        
        req.setMethod('POST');
                 
        try {
                System.debug('Inside Try');
                res = http.send(req);
                System.debug('Successfully logged out'+res.getBody());
            }
            catch(Exception e)
            {
                System.debug('Problem logging out'+res.getBody());
            }
}
}