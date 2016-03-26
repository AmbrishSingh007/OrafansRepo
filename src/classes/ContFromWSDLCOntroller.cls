public class ContFromWSDLCOntroller {
public String stockQuoteFuture; 
public String result{get;set;}
           


    // Action method
    public Continuation startRequest() {    
       Integer TIMEOUT_INT_SECS = 60;  
       Continuation cont = new Continuation(TIMEOUT_INT_SECS);
       cont.continuationMethod = 'processResponse';
       
      
           stockQuoteFuture = new MyWebserviceClass.GlobalWeatherSoap ().GetWeather('Pune', 'India');  
       return cont;   
    }    
    
    // Callback method
    public Object processResponse() {    
       result = stockQuoteFuture;
       // Return null to re-render the original Visualforce page
       return null; 
    }
}