public class XmlStreamReaderDemo {

    // Create a class Book for processing
    public class Book {
        String name;
        String author;
    }

    public Book[] parseBooks(XmlStreamReader reader) {
        Book[] books = new Book[0];
        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {
            // Start at the beginning of the book and make sure that it is a book
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                if ('Book' == reader.getLocalName()) {
                    // Pass the book to the parseBook method (below) 
                    Book book = parseBook(reader);
                    books.add(book);
                }
            }
            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        System.debug('---'+books);
        return books;
    }

    // Parse through the XML, determine the author and the characters
    Book parseBook(XmlStreamReader reader) {
        Book book = new Book();
        book.author = reader.getAttributeValue(null, 'author');
        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {
            if (reader.getEventType() == XmlTag.END_ELEMENT) {
                break;
            } else if (reader.getEventType() == XmlTag.CHARACTERS) {
                book.name = reader.getText();
            }
            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        System.debug('---'+book);
        return book;
    }
    public void run()
    {
    new XmlStreamReaderDemo().parseBooks(new XmlStreamReader('<CurrentWeather>'+
  '<Location>Bhaunagar, India (VABV) 21-45N 072-12E 11M</Location>'+
  '<Time>Jan 28, 2011 - 07:00 PM EST / 2011.01.29 0000 UTC</Time>'+
  '<Wind> from the NW (320 degrees) at 5 MPH (4 KT):0</Wind>'+
  '<Visibility> 3 mile(s):0</Visibility>'+
  '<Temperature> 60 F (16 C)</Temperature>'+
  '<DewPoint> 37 F (3 C)</DewPoint>'+
  '<RelativeHumidity> 41%</RelativeHumidity>'+
  '<Pressure> 29.91 in. Hg (1013 hPa)</Pressure>'+
  '<Status>Success</Status>'+
'</CurrentWeather>'));
    }
}