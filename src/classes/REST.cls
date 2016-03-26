public class REST {

   @future(callout=true)
    public static void parseJSONResponse(Id i,String cityname) {
        if(cityname!=null){        
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'http://api.openweathermap.org/data/2.5/weather?q='+cityname;
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        
        
        JSONParser parser = JSON.createParser(response.getBody());
        WeatherData__c w=new WeatherData__c();
        while (parser.nextToken() != null) {
            //BookDetails b=new BookDetails();
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) ) 
                 {
                if(parser.getText() == 'temp'){
                parser.nextToken();
                w.temp__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'temp_min'){
                parser.nextToken();
                w.temp_min__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'temp_max'){
                parser.nextToken();
                w.temp_max__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'pressure'){
                parser.nextToken();
                w.pressure__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'sea_level'){
                parser.nextToken();
                w.sea_level__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'grnd_level'){
                parser.nextToken();
                w.grnd_level__c=parser.getDecimalValue();
                system.debug('---' + parser.getText());
                
                
                }   
                else if(parser.getText() == 'humidity'){
                parser.nextToken();
                w.humidity__c=parser.getDecimalValue(); 
                system.debug('---' + parser.getText());
                }   
            }  
        }
        w.WeatherData__c=i;
        insert w;
    
        }
        }

/*        
public class WeatherData{
    //main":{"temp":295.593,"temp_min":295.593,"temp_max":295.593,"pressure":947.5,"sea_level":1017.76,"grnd_level":947.5,"humidity":100}
    //,"wind":{"speed":3.32,"deg":251.5},"clouds":{"all":92},"rain":{"3h":1}
    
    Main m;//=new Main();
    public WeatherData(Main m){
    this.m=m;
    }
        
    } 
    public class Main{
    public Decimal temp;//{set;get;}
    public Decimal temp_min;
    public Decimal temp_max;
    public Decimal pressure;
    public Decimal sea_level;
    public Decimal grnd_level;
    public Decimal humidity;

    public Decimal getTemp() {
        return temp;
    }
    public void setTemp(Decimal temp) {
        this.temp = temp;
    }
    public Decimal getTemp_min() {
        return temp_min;
    }
    public void setTemp_min(Decimal temp_min) {
        this.temp_min = temp_min;
    }
    public Decimal getTemp_max() {
        return temp_max;
    }
    public void setTemp_max(Decimal temp_max) {
        this.temp_max = temp_max;
    }
    public Decimal getPressure() {
        return pressure;
    }
    public void setPressure(Decimal pressure) {
        this.pressure = pressure;
    }
    public Decimal getSea_level() {
        return sea_level;
    }
    public void setSea_level(Decimal sea_level) {
        this.sea_level = sea_level;
    }
    public Decimal getGrnd_level() {
        return grnd_level;
    }
    public void setGrnd_level(Decimal grnd_level) {
        this.grnd_level = grnd_level;
    }
    public Decimal getHumidity() {
        return humidity;
    }
    public void setHumidity(Decimal humidity) {
        this.humidity = humidity;
    }
    
    
    }
    public class Coord{
    String lat{get;set;}
    String lon{get;set;}
    public Coord(String lat,String lon){
    this.lat=lat;
    this.lon=lon;
    }
    }*/
    
    }