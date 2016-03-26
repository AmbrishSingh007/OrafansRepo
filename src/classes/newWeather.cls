public class newWeather {
    public WeatherData__c myWeatherData{set;get;}
    public newWeather(ApexPages.StandardController controller) {
        myWeatherData=new WeatherData__c();
    }
    public void doChange(){
        myWeatherData.Picklist1__c='C';
        myWeatherData.Dependent__c='A';
    }

}