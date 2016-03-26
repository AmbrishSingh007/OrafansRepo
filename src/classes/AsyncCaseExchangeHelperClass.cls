//Generated by wsdl2apex

public class AsyncCaseExchangeHelperClass {
    public class updateContactResponse_elementFuture extends System.WebServiceCalloutFuture {
        public void getValue() {
            System.WebServiceCallout.endInvoke(this);
        }
    }
    public class AsyncCaseExchangeService {
        public String endpoint_x = 'https://cs20.salesforce.com/services/Soap/class/CaseExchangeService';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public CaseExchangeHelperClass.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public CaseExchangeHelperClass.DebuggingHeader_element DebuggingHeader;
        public CaseExchangeHelperClass.DebuggingInfo_element DebuggingInfo;
        public CaseExchangeHelperClass.SessionHeader_element SessionHeader;
        public CaseExchangeHelperClass.CallOptions_element CallOptions;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/CaseExchangeService';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/CaseExchangeService';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/CaseExchangeService';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/CaseExchangeService';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/CaseExchangeService';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/CaseExchangeService', 'CaseExchangeHelperClass'};
        public AsyncCaseExchangeHelperClass.updateContactResponse_elementFuture beginUpdateContact(System.Continuation continuation,String caseSfdcID,String userID,String entitlementResult) {
            CaseExchangeHelperClass.updateContact_element request_x = new CaseExchangeHelperClass.updateContact_element();
            request_x.caseSfdcID = caseSfdcID;
            request_x.userID = userID;
            request_x.entitlementResult = entitlementResult;
            return (AsyncCaseExchangeHelperClass.updateContactResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCaseExchangeHelperClass.updateContactResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/CaseExchangeService',
              'updateContact',
              'http://soap.sforce.com/schemas/class/CaseExchangeService',
              'updateContactResponse',
              'CaseExchangeHelperClass.updateContactResponse_element'}
            );
        }
    }
}