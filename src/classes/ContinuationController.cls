public with sharing class ContinuationController {
    //public String result {get;set;}
    public void startRequestNew(){
    ContinuationHelper ch=new ContinuationHelper();
    ch.startRequest();
    
    }
    //public void startRequest(){}
    
    public String requestLabel;
    // Result of callout
    public String result {get;set;}
    // Endpoint of long-running service
    private static final String LONG_RUNNING_SERVICE_URL = 'http://it-ebooks-api.info/v1/search/java';
   
   // Action method
    public Object startRequest() {
    System.debug('---startRequest()');
      // Create continuation with a timeout
      Continuation con = new Continuation(40);
      // Set callback method
      con.continuationMethod='processResponse';
      
      // Create callout request
      HttpRequest req = new HttpRequest();
      req.setMethod('GET');
      req.setEndpoint(LONG_RUNNING_SERVICE_URL);
      
      // Add callout request to continuation
      this.requestLabel = con.addHttpRequest(req);
      System.debug('---return from continuation'+con);  
      // Return the continuation
      return con;  
    }
    
    // Callback method 
    public Object processResponse() {  
      System.debug('---processResponse()');   
      // Get the response by using the unique label
      HttpResponse response = Continuation.getResponse(this.requestLabel);
      // Set the result variable that is displayed on the Visualforce page
      System.debug('---processResponseBody()'+response.getBody());
      this.result = response.getBody();
      
      // Return null to re-render the original Visualforce page
      return null;
    }
   
}