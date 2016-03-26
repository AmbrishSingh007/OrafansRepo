public class Redirect {

    public Redirect(ApexPages.StandardController controller) {

    }
    public PageReference getURL()
    {
        PageReference newPage = Page.CloseLeadFromCampaign;
        newPage.getParameters().put('cid', ApexPages.CurrentPage().getParameters().get('id'));
        return newPage;
    }
    public Id getCid()
    {
        return ApexPages.CurrentPage().getParameters().get('id');
    }

}