global class AccountPlan {
  
   webservice String area; 
   webservice String region; 
   //webservice Plan vPlan2; 
   //Define an object in apex that is exposed in apex web service
   /*global class Plan {
      webservice String name;
      webservice Integer planNumber;
      webservice Date planningPeriod;
      webservice Id planId;
   }*/

   //webservice static Plan createAccountPlan(Plan vPlan) {
   //webservice static String createAccountPlan(String vPlan) {
   webservice static String createAccountPlan(Plan1.GamePlan vPlan1,String area,String region) {
       
       //A plan maps to the Account object in salesforce.com. 
       //So need to map the Plan class object to Account standard object
       /*Account acct = new Account();
       acct.Name = vPlan.name;
       acct.AccountNumber = String.valueOf(vPlan.planNumber);
       insert acct;
       
       vPlan.planId=acct.Id;
       return vPlan;*/
       return null;
  }
  

}