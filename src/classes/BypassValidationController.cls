public class BypassValidationController {
public Account acc{set;get;}
public boolean flag{get;set;}
public List<String> errorM{set;get;}
public BypassValidationController(){
    acc=new Account();
    flag=false;
}
public void enterValue(){
System.debug('---enterValidation');
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error Message from Enter Value'));
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Just Kidding'));
ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Hahahaha'));
flag=false;
for(ApexPages.Message m:ApexPages.getMessages())
    {
        String x=m.getSummary()+'';
        System.debug('---'+x);
    }
//errorM
}
public PageReference redirect(){// 
flag=true;
System.debug('---'+flag);
//ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Error Message');
/*if(flag==true)
    return null;*/
pagereference p = Page.ITEBooks;
p.setredirect(true);
System.debug('---Inside Redirect');
return p;
}
}