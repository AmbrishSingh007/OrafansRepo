public class TestData {
public String data{set;get;}
List<Map<String,String>> listMap=new List<Map<String,String>>();
Map<String,String> m=new Map<String,String>();
public String d1{set;get;}
public String d2{set;get;}
public String d3{set;get;}
public String d4{set;get;}
public String d5{set;get;}
public String d6{set;get;}
public String d7{set;get;}
public String d8{set;get;}
public String d9{set;get;}

public String display{set;get;}
public TestData(){
    Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'http://it-ebooks.info/book/3000/';//'http://it-ebooks-api.info/v1/search/java';
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response = httpProtocol.send(request);
        //JSONParser parser = JSON.createParser(response.getBody());
        //System.debug('-----'+parser);
        data=response.getBody()+'';
        
        
        
        /*dom.Document doc = response.getBodyDocument();
        //invoices = new List();
        for(dom.XmlNode node : doc.getRootElement().getChildElements()) {
          if(node.getName()=='invoice') {
             //Invoice iv = new Invoice();
             //iv.from_xml(node);
             //invoices.add(iv);
             }
        }  */
        d1=getExtractData('itemprop="publisher">','</a>','Publisher');
        d2=getExtractData('itemprop="author" style="display:none;">','</b>','Author');
        d3=getExtractData('itemprop="isbn">','</b>','ISBN');
        d4=getExtractData('itemprop="datePublished">','</b>','Year');
        d5=getExtractData('itemprop="numberOfPages">','</b>','Pages');
        d6=getExtractData('itemprop="inLanguage">','</b>','Language');
        d7=getExtractData('itemprop="bookFormat">','</b>','Format');
        d8=getExtractData('Download:</td><td><a href=\'','\'>','Link');
        d9=getExtractData('<img src="/','.jpg" alt=','ImageURL');
        
        
        }  
        public String getExtractData(String str,String strEnd,String key){
        
        Integer l1,s1,e1;
        
        l1=str.length();
        s1=data.indexOf(str);
        e1=data.substring(data.indexOf(str)).indexOf(strEnd);
        //m.put(key,data.substring(s1+l1,s1+e1));   
        
        return data.substring(s1+l1,s1+e1);
        //e1=data.indexOf(strEnd);
        //return l1+' '+s1+' '+e1;
        }
}