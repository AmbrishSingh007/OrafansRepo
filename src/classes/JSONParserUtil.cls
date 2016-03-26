public class JSONParserUtil {
    public static List<BookDetails> bookDetails=null;
    public static String query{set;get;}
    public JSONParserUtil()
    {
        query=null;
    }
    public List<BookDetails> getBookDetails()
    {
        parseJSONResponse();
        return bookDetails;
    }
    //@future(callout=true)
    public static HTTPResponse parseJSONResponse() {
         HttpResponse response =null;
         query='java';
        if(query!=null){        
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'http://it-ebooks-api.info/v1/search/'+query;
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        response = httpProtocol.send(request);
        //System.debug(response.getBody());
        
        bookDetails =new List<BookDetails>(); 
        JSONParser parser = JSON.createParser(response.getBody());
        System.debug('-----'+parser);
        
        BookDetails b=new BookDetails();
        while (parser.nextToken() != null) {
            //BookDetails b=new BookDetails();
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) ) 
                 {
                if(parser.getText() == 'ID'){
                parser.nextToken();
                b.setId(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'Title'){
                parser.nextToken();
                b.setTitle(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'SubTitle'){
                parser.nextToken();
                b.setSubTitle(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'Description'){
                parser.nextToken();
                b.setDescription(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'Image'){
                parser.nextToken();
                b.setImage(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'isbn'){
                parser.nextToken();
                b.setIsbn(parser.getText());
                system.debug('---' + parser.getText());
                bookDetails.add(b);
                b=new BookDetails();
                }   
            }  
        }
        }
        return response;
        
    }  
    public class BookDetails
    {
        String id,title,subTitle,description,image,isbn;
        public BookDetails(){}
        public BookDetails(String id, String title, String subTitle, String description,
            String image, String isbn) {
        this.id = id;
        this.title = title;
        this.subTitle = subTitle;
        this.description = description;
        this.image = image;
        this.isbn = isbn;
    }
        public String getId() {
        return id;
        }

        public void setId(String id) {
            this.id = id;
        }
    
        public String getTitle() {
            return title;
        }
    
        public void setTitle(String title) {
            this.title = title;
        }
    
        public String getSubTitle() {
            return subTitle;
        }
    
        public void setSubTitle(String subTitle) {
            this.subTitle = subTitle;
        }
    
        public String getDescription() {
            return description;
        }
    
        public void setDescription(String description) {
            this.description = description;
        }
    
        public String getImage() {
            return image;
        }
    
        public void setImage(String image) {
            this.image = image;
        }
    
        public String getIsbn() {
            return isbn;
        }
    
        public void setIsbn(String isbn) {
            this.isbn = isbn;
        }
    } 
}