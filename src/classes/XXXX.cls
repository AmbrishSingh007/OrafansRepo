public class XXXX {
public String selected{set;get;}
public List<Account> acc{set;get;}
public List<String> str{set;get;}
    public XXXX(ApexPages.StandardSetController controller) {
        //acc=[select id,name Account limit 5];
        str=new List<String>();
        str.add('A');
        str.add('B');
        str.add('C');
    }
     public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('US','US')); 
        options.add(new SelectOption('CANADA','Canada')); 
        options.add(new SelectOption('MEXICO','Mexico')); return options; 
    }

}