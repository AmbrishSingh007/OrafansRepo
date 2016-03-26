@isTest
public class SampleTest{
  @IsTest(SeeAllData=true) //enables u 2 view all data otherwise u need to create data using ur test method
  public static void testDisplay() {
          //target should be to run every line of the class by making use of test method 
          //testing +ve or -ve test cases is a different issue 
         new Sample().displayAll();
         new Sample().display('0019000000twDIe');
          //System.assertEquals(controller.changePassword(),null);        
 }    
}