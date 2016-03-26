global class ITEbooksController {
    public  List<BookDetails> bookDetails{set;get;}
    public  String query{set;get;}
    public  Boolean render{set;get;}
    UserData__c usr{set;get;}
    public  List<DownloadDetailsOfBook> listedBooks{set;get;}
    public ITEbooksController()
    {
        render=false;
        query=null;
    }
    public UserData__c getUsr(){return usr;}
    /*public Boolean getRender()
    {
        return render;
    }*/
    /*public List<BookDetails> getBookDetails()
    {
        //parseJSONResponse();
        return bookDetails;
    }*/
    public  void refreshData()
    {
        parseJSONResponse();
        render=true; 
    }
    //@future(callout=true)
    void parseJSONResponse() {
        if(query!=null){        
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String q = query.replace(' ', '%20');
        String endpoint = 'http://it-ebooks-api.info/v1/search/'+q;
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        HttpResponse response = httpProtocol.send(request);
        //System.debug(response.getBody());
        
        bookDetails =new List<BookDetails>(); // Bound to change
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
    }  
    public  PageReference getSelected()
    {
        //parseJSONResponse();
        //System.debug('***'+query);
        listedBooks=new List<DownloadDetailsOfBook>();//List<DownloadDetailsOfBook> 
        //Integer c=0;
        for(BookDetails book:bookDetails)
        {
            if(book.check==true)
                listedBooks.add(GetDataFrmSite(book.id)); 
                //if(c++<=5)
                    //listedBooks.add(GetDataFrmSite(book.id));
                //System.debug('***'+GetDataFrmSite(book.id));
                //System.debug('***'+book.check);
        }
        if(usr==null)usr=new UserData__c();//IMPORTANT
        if(listedBooks.size()>0)
            return Page.UserInfo;
        else{
            //ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, 'my error msg');
            return null;
            }
    } 
    public  PageReference Done()
    {
        insert usr;
        sendMail(listedBooks);
        return Page.ITEBooks;
    }
    public  DownloadDetailsOfBook GetDataFrmSite(String id)
    {
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'http://it-ebooks-api.info/v1/book/'+id;
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        JSONParser parser = JSON.createParser(response.getBody());
        
        DownloadDetailsOfBook b=new DownloadDetailsOfBook(); 
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
                else if(parser.getText() == 'Author'){
                parser.nextToken();
                b.setAuthor(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'ISBN'){
                parser.nextToken();
                b.setIsbn(parser.getText());
                system.debug('---' + parser.getText());
                }
                else if(parser.getText() == 'Page'){
                parser.nextToken();
                b.setPage(parser.getText());
                system.debug('---' + parser.getText());
                }   
                else if(parser.getText() == 'Year'){
                parser.nextToken();
                b.setYear(parser.getText());
                system.debug('---' + parser.getText());
                }   
                else if(parser.getText() == 'Publisher'){
                parser.nextToken();
                b.setPublisher(parser.getText());
                system.debug('---' + parser.getText());
                }   
                else if(parser.getText() == 'Download'){
                parser.nextToken();
                b.setDownload(parser.getText());
                system.debug('---' + parser.getText());
                }   
            }  
    }
    return b;
    }
    public  void sendMail(List<DownloadDetailsOfBook> allListedBooks)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        String[] toAddresses = new String[] {usr.EmailID__c,'orafans999@gmail.com'}; 
        mail.setToAddresses(toAddresses); 
        mail.setSubject('Automated email: Sending download link(s) for selected book(s)'); 
        String body = 'Hi '+usr.name+'\n\nWe are happy to help you in getting the ebooks of your choice.\n\n'+'Book Details \n'; 
        for(DownloadDetailsOfBook b:allListedBooks)
            body=body+b+'\n\n';
        mail.setPlainTextBody(body); 
        Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
    }
    public class DownloadDetailsOfBook{
    public String id{set;get;}
    public String title{set;get;}
    public String subtitle{set;get;}
    public String author{set;get;}
    public String isbn{set;get;}
    public String page{set;get;}
    public String year{set;get;}
    public String publisher{set;get;}
    public String download{set;get;}
    public DownloadDetailsOfBook(){}
    public DownloadDetailsOfBook(String id,String title,String subtitle,String author,String isbn,String page,String year,String publisher,String download)
    {
        this.id=id;
        this.title=title;
        this.subtitle=subtitle;
        this.author=author;
        this.isbn=isbn;
        this.page=page;
        this.year=year;
        this.publisher=publisher;
        this.download=download;
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
    public String getSubtitle() {
        return subtitle;
    }
    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public String getPage() {
        return page;
    }
    public void setPage(String page) {
        this.page = page;
    }
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getPublisher() {
        return publisher;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public String getDownload() {
        return download;
    }
    public void setDownload(String download) {
        this.download = download;
    }

    }
    public class BookDetails
    {
        public Boolean check{set;get;}
         String id,title,subTitle,description,image,isbn;
        public BookDetails(){}
        public BookDetails(String id, String title, String subTitle, String description,
            String image, String isbn) {
        check=false;
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