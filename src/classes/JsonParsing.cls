public class JsonParsing {
public string strJson{get;set;}
public List<Accountwrap> jsonLst{get;set;}

    public JsonParsing (){
        jsonLst = new List<Accountwrap> ();
    }

    public void getlstAccount(){
        List < Accountwrap > lstwrap = new List < Accountwrap > ();
        List < account > lstacc = new List < account > ();
        lstacc = [SELECT Id, Name, Phone FROM Account limit 10];

        for (Account a: lstacc) {
            Accountwrap awrap = new Accountwrap(a.Phone,a.name,a.id);
            lstwrap.add(awrap);
        }
        strJson = JSON.serialize(lstwrap);
    }
    
    public void convertObj(){
        jsonLst = parse(strJson);
    }
    
    //Subclass : Wrapper Class 
    public class Accountwrap {
        //Static Variables 
        public string id;
        public string name;
        public string Phone;
        
        //Wrapper  Class Controller
        Accountwrap(string Phone, string name, string id) {
            this.Phone = Phone;
            this.name = name;
            this.id = id;
        }
    }
    
    public static List<Accountwrap> parse(String str) {

        system.debug('*****str*****'+str );
        JSONParser parser = JSON.createParser(str);
        system.debug('*****parse*****'+parser );
        List<Accountwrap> jsonstatLst = new List<Accountwrap> ();
        while (parser.nextToken() != null) { System.debug('Current token: ' +  parser.getCurrentToken() + '****JSONToken.START_ARRAY****'+JSONToken.START_ARRAY);
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                while (parser.nextToken() != null) {
                    // Advance to the start object marker to
                    //  find next invoice statement object.
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        jsonstatLst.add((Accountwrap)parser.readValueAs(Accountwrap.class));
                        parser.skipChildren();
                    }
                }
            }
        }
        return jsonstatLst;
    }

}