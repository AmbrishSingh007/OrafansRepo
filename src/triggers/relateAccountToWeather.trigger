trigger relateAccountToWeather on Account (after insert,after update) {
List<String> accList=new List<String>();
for(Account a: trigger.new)
{
    //System.debug(a.BillingCity);
    //REST.parseJSONResponse(a.id,a.BillingCity+'');
    //WeatherReport.addWeatherData(a.id,a.BillingCity+'',a.BillingCountry+'');
    accList.add(JSON.serialize(new AccData(a.Id,a.BillingCity+'',a.BillingCountry+'')));
}
WeatherReport.addWeatherData(accList);
}