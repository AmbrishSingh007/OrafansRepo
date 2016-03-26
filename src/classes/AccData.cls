public class AccData{
    public Id i{set;get;}
    public String billingCity{set;get;}
    public String billingCountry{set;get;}
    public AccData(Id i,String billingCity,String billingCountry)
    {
        this.i=i;
        this.billingCity=billingCity;
        this.billingCountry=billingCountry;
    }
}