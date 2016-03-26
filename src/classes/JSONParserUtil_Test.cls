@isTest
public class JSONParserUtil_Test{

  static testMethod void shouldBeAbleToGetData(){
    //Case myCase = getTestCase();
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new Mock123());
    HttpResponse res =JSONParserUtil.parseJSONResponse();
    System.debug('---'+res);
    Test.stopTest();
  }
}