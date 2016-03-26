public with sharing class WeatherReport {
   public static String result;
     @future(callout=true)
     public static void addWeatherData(List<String> accList){
     AccData d=null;
         for(String data: accList)
         {
             d=(AccData) JSON.deserialize(data, AccData.class);
             result=new MyWebserviceClass.GlobalWeatherSoap ().GetWeather(d.billingCity, d.billingCountry);
             addWeatherData(d.i);
         }
     }
    public static void addWeatherData(Id i){//
        //MyWebserviceClass.GlobalWeatherSoap  weather = new MyWebserviceClass.GlobalWeatherSoap ();
        //weather.GetWeather('Pune', 'India');
        //GetWeather(String CityName,String CountryName)
        //result=new MyWebserviceClass.GlobalWeatherSoap ().GetWeather(city, country);
        //System.debug('---'+new MyWebserviceClass.GlobalWeatherSoap ().GetCitiesByCountry('India'));
       /* System.debug('---'+parse('Location'));    
        System.debug('---'+parse('Time'));
        System.debug('---'+parse('Wind'));
        System.debug('---'+parse('Visibility'));
        System.debug('---'+parse('Temperature'));
        System.debug('---'+parse('DewPoint'));
        System.debug('---'+parse('RelativeHumidity'));
        System.debug('---'+parse('Pressure'));
        System.debug('---'+parse('Status'));*/
        
       
        WeatherData2__c wd=new WeatherData2__c();
        wd.Location__c=parse('Location');
        wd.Time__c=parse('Time');
        wd.Wind__c=parse('Wind');
        wd.Visibility__c=parse('Visibility');
        wd.Temperature__c=parse('Temperature');
        wd.DewPoint__c=parse('DewPoint');
        wd.RelativeHumidity__c=parse('RelativeHumidity');
        wd.Pressure__c=parse('Pressure');
        wd.Status__c=parse('Status');
        wd.WeatherData2__c=i;
        insert wd;
        System.debug('---'+result);
        
    }
    public static String parse(String s)
    {
            Integer l=s.length()+1;
            return result.substring(result.indexOf(s)+l,result.lastIndexOf(s)-2);
    }
    public static void display()
    {
            String d='<?xml version="1.0" encoding="utf-16"?>'+
            '<CurrentWeather>'+
            '<Location>Bhaunagar, India (VABV) 21-45N 072-12E 11M</Location>'+
            '<Time>Jan 28, 2011 - 07:00 PM EST / 2011.01.29 0000 UTC</Time>'+
            '<Wind> from the NW (320 degrees) at 5 MPH (4 KT):0</Wind>'+
            '<Visibility> 3 mile(s):0</Visibility>'+
            '<Temperature> 60 F (16 C)</Temperature>'+
            '<DewPoint> 37 F (3 C)</DewPoint>'+
            '<RelativeHumidity> 41%</RelativeHumidity>'+
            '<Pressure> 29.91 in. Hg (1013 hPa)</Pressure>'+
            '<Status>Success</Status>'+
            '</CurrentWeather>'; 
            Dom.Document doc = new Dom.Document();
            doc.load(d);
            Dom.XMLNode data = doc.getRootElement();
        
        String loc = data.getChildElement('Location', null).getText();
        String stat = data.getChildElement('Pressure', null).getText();
       
        System.debug('---Location: ' + loc);
        System.debug('---Pressure: ' + stat);
    }
}