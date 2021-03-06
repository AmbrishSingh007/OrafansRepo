//Generated by wsdl2apex

public class AsyncGSDEntitlementServiceWrapper {
    public class GetStandardOffersForPreEntitlement_JsonResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.GSDEntitlementSearchResult getValue() {
            GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_element response = (GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetStandardOffersForPreEntitlement_JsonResult;
        }
    }
    public class TESTCAll_CZ34393137_USInputResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.GSDEntitlementSearchResult getValue() {
            GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_element response = (GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.TESTCAll_CZ34393137_USInputResult;
        }
    }
    public class ReCalculateCoverageResponseResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.Entitlement getValue() {
            GSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_element response = (GSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.ReCalculateCoverageResponseResult;
        }
    }
    public class GetProductDataUsingDataContractResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.Products getValue() {
            GSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_element response = (GSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetProductDataUsingDataContractResult;
        }
    }
    public class GetStandardOffersForPreEntitlementResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.GSDEntitlementSearchResult getValue() {
            GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_element response = (GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetStandardOffersForPreEntitlementResult;
        }
    }
    public class GetEntitlementDataUsingDataContractResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.Entitlement getValue() {
            GSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_element response = (GSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetEntitlementDataUsingDataContractResult;
        }
    }
    public class GetEntitlementOffersUsingDataContractResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.GSDEntitlementSearchResult getValue() {
            GSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_element response = (GSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.GetEntitlementOffersUsingDataContractResult;
        }
    }
    public class ProcessEntitlementRequestXMLResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            GSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_element response = (GSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.ProcessEntitlementRequestXMLResult;
        }
    }
    public class TESTCAll_CZ34393137_USResponse_elementFuture extends System.WebServiceCalloutFuture {
        public GSDEntitlementServiceWrapper.GSDEntitlementSearchResult getValue() {
            GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_element response = (GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.TESTCAll_CZ34393137_USResult;
        }
    }
    public class AsyncGSDEntitlementServiceSOAPSoap {
        public String endpoint_x = 'http://c4w13410.itcs.hpecorp.net/cscservices/GSDEntitlementServiceASMX/GSDEntitlementServiceSOAP.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://GSDServiceWrappers.com/services', 'GSDEntitlementServiceWrapper'};
        public AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_elementFuture beginGetStandardOffersForPreEntitlement_Json(System.Continuation continuation,GSDEntitlementServiceWrapper.ArrayOfGSDOffer NonStandardOfferList,String SerialNumber,String ProductNumber,String ContractID,String transactionID,String isoCountryCode,String userID,String userRegion,String callCenterID,String contractIDType) {
            GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_Json_element request_x = new GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_Json_element();
            request_x.NonStandardOfferList = NonStandardOfferList;
            request_x.SerialNumber = SerialNumber;
            request_x.ProductNumber = ProductNumber;
            request_x.ContractID = ContractID;
            request_x.transactionID = transactionID;
            request_x.isoCountryCode = isoCountryCode;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            request_x.contractIDType = contractIDType;
            return (AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/GetStandardOffersForPreEntitlement_Json',
              'http://GSDServiceWrappers.com/services',
              'GetStandardOffersForPreEntitlement_Json',
              'http://GSDServiceWrappers.com/services',
              'GetStandardOffersForPreEntitlement_JsonResponse',
              'GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_JsonResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_elementFuture beginTESTCAll_CZ34393137_USInput(System.Continuation continuation,String serialNumber,String contractID,String productNumber,String isSFDCTool,String umbrellaContractID,String CountryCode) {
            GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInput_element request_x = new GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInput_element();
            request_x.serialNumber = serialNumber;
            request_x.contractID = contractID;
            request_x.productNumber = productNumber;
            request_x.isSFDCTool = isSFDCTool;
            request_x.umbrellaContractID = umbrellaContractID;
            request_x.CountryCode = CountryCode;
            return (AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/TESTCAll_CZ34393137_USInput',
              'http://GSDServiceWrappers.com/services',
              'TESTCAll_CZ34393137_USInput',
              'http://GSDServiceWrappers.com/services',
              'TESTCAll_CZ34393137_USInputResponse',
              'GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USInputResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_elementFuture beginReCalculateCoverageResponse(System.Continuation continuation,String offerID,String EntitlementResponseXml,String transactionID,String userID,String userRegion,String callCenterID) {
            GSDEntitlementServiceWrapper.ReCalculateCoverageResponse_element request_x = new GSDEntitlementServiceWrapper.ReCalculateCoverageResponse_element();
            request_x.offerID = offerID;
            request_x.EntitlementResponseXml = EntitlementResponseXml;
            request_x.transactionID = transactionID;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            return (AsyncGSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/ReCalculateCoverageResponse',
              'http://GSDServiceWrappers.com/services',
              'ReCalculateCoverageResponse',
              'http://GSDServiceWrappers.com/services',
              'ReCalculateCoverageResponseResponse',
              'GSDEntitlementServiceWrapper.ReCalculateCoverageResponseResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_elementFuture beginGetProductDataUsingDataContract(System.Continuation continuation,String contractID,String local,String isoCountryCode,String transactionID,String userID,String userRegion,String callCenterID) {
            GSDEntitlementServiceWrapper.GetProductDataUsingDataContract_element request_x = new GSDEntitlementServiceWrapper.GetProductDataUsingDataContract_element();
            request_x.contractID = contractID;
            request_x.local = local;
            request_x.isoCountryCode = isoCountryCode;
            request_x.transactionID = transactionID;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            return (AsyncGSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/GetProductDataUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetProductDataUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetProductDataUsingDataContractResponse',
              'GSDEntitlementServiceWrapper.GetProductDataUsingDataContractResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_elementFuture beginGetStandardOffersForPreEntitlement(System.Continuation continuation,GSDEntitlementServiceWrapper.ArrayOfGSDOffer NonStandardOfferList,String SerialNumber,String ProductNumber,String ContractID,String transactionID,String isoCountryCode,String userID,String userRegion,String callCenterID,String contractIDType) {
            GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_element request_x = new GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlement_element();
            request_x.NonStandardOfferList = NonStandardOfferList;
            request_x.SerialNumber = SerialNumber;
            request_x.ProductNumber = ProductNumber;
            request_x.ContractID = ContractID;
            request_x.transactionID = transactionID;
            request_x.isoCountryCode = isoCountryCode;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            request_x.contractIDType = contractIDType;
            return (AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/GetStandardOffersForPreEntitlement',
              'http://GSDServiceWrappers.com/services',
              'GetStandardOffersForPreEntitlement',
              'http://GSDServiceWrappers.com/services',
              'GetStandardOffersForPreEntitlementResponse',
              'GSDEntitlementServiceWrapper.GetStandardOffersForPreEntitlementResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_elementFuture beginGetEntitlementDataUsingDataContract(System.Continuation continuation,String serialNo,String countryCd,String productNo,String includeServiceNotes,String contractID,String contractIDType,String isSWFTool,String includeAmids,String ProofPurchaseDate,String BODServiceID,String isProductOwnershipConsumer,String transactionID,String userID,String userRegion,String callCenterID) {
            GSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContract_element request_x = new GSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContract_element();
            request_x.serialNo = serialNo;
            request_x.countryCd = countryCd;
            request_x.productNo = productNo;
            request_x.includeServiceNotes = includeServiceNotes;
            request_x.contractID = contractID;
            request_x.contractIDType = contractIDType;
            request_x.isSWFTool = isSWFTool;
            request_x.includeAmids = includeAmids;
            request_x.ProofPurchaseDate = ProofPurchaseDate;
            request_x.BODServiceID = BODServiceID;
            request_x.isProductOwnershipConsumer = isProductOwnershipConsumer;
            request_x.transactionID = transactionID;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            return (AsyncGSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/GetEntitlementDataUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetEntitlementDataUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetEntitlementDataUsingDataContractResponse',
              'GSDEntitlementServiceWrapper.GetEntitlementDataUsingDataContractResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_elementFuture beginGetEntitlementOffersUsingDataContract(System.Continuation continuation,String serialNumber,String isoCountryCode,String productNumber,String contractID,String contractIDType,String isSFDCTool,String umbrellaContractID,String umbrellaSerialNumber,String searchType,String transactionID,String userID,String userRegion,String callCenterID,String NextIndex,GSDEntitlementServiceWrapper.ArrayOfGSDOffer SelectedOffer) {
            GSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContract_element request_x = new GSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContract_element();
            request_x.serialNumber = serialNumber;
            request_x.isoCountryCode = isoCountryCode;
            request_x.productNumber = productNumber;
            request_x.contractID = contractID;
            request_x.contractIDType = contractIDType;
            request_x.isSFDCTool = isSFDCTool;
            request_x.umbrellaContractID = umbrellaContractID;
            request_x.umbrellaSerialNumber = umbrellaSerialNumber;
            request_x.searchType = searchType;
            request_x.transactionID = transactionID;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            request_x.NextIndex = NextIndex;
            request_x.SelectedOffer = SelectedOffer;
            return (AsyncGSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/GetEntitlementOffersUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetEntitlementOffersUsingDataContract',
              'http://GSDServiceWrappers.com/services',
              'GetEntitlementOffersUsingDataContractResponse',
              'GSDEntitlementServiceWrapper.GetEntitlementOffersUsingDataContractResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_elementFuture beginProcessEntitlementRequestXML(System.Continuation continuation,String serialNumber,String isoCountryCode,String productNumber,String contractID,GSDEntitlementServiceWrapper.GSDEntitlementSearchResult gsdEntitlementResult,GSDEntitlementServiceWrapper.Entitlement entitlement,String answer,Boolean isFromSFDCTool,Boolean includeServiceNotes,Boolean includeAMID,String proofOfPurchase,String bornOnDateID,String productOwnsershipConsumer,String contractType,String transactionID,String userID,String userRegion,String callCenterID,GSDEntitlementServiceWrapper.ArrayOfGSDOffer SelectedOffer,String sourcetype) {
            GSDEntitlementServiceWrapper.ProcessEntitlementRequestXML_element request_x = new GSDEntitlementServiceWrapper.ProcessEntitlementRequestXML_element();
            request_x.serialNumber = serialNumber;
            request_x.isoCountryCode = isoCountryCode;
            request_x.productNumber = productNumber;
            request_x.contractID = contractID;
            request_x.gsdEntitlementResult = gsdEntitlementResult;
            request_x.entitlement = entitlement;
            request_x.answer = answer;
            request_x.isFromSFDCTool = isFromSFDCTool;
            request_x.includeServiceNotes = includeServiceNotes;
            request_x.includeAMID = includeAMID;
            request_x.proofOfPurchase = proofOfPurchase;
            request_x.bornOnDateID = bornOnDateID;
            request_x.productOwnsershipConsumer = productOwnsershipConsumer;
            request_x.contractType = contractType;
            request_x.transactionID = transactionID;
            request_x.userID = userID;
            request_x.userRegion = userRegion;
            request_x.callCenterID = callCenterID;
            request_x.SelectedOffer = SelectedOffer;
            request_x.sourcetype = sourcetype;
            return (AsyncGSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/ProcessEntitlementRequestXML',
              'http://GSDServiceWrappers.com/services',
              'ProcessEntitlementRequestXML',
              'http://GSDServiceWrappers.com/services',
              'ProcessEntitlementRequestXMLResponse',
              'GSDEntitlementServiceWrapper.ProcessEntitlementRequestXMLResponse_element'}
            );
        }
        public AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_elementFuture beginTESTCAll_CZ34393137_US(System.Continuation continuation) {
            GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_US_element request_x = new GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_US_element();
            return (AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncGSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://GSDServiceWrappers.com/services/TESTCAll_CZ34393137_US',
              'http://GSDServiceWrappers.com/services',
              'TESTCAll_CZ34393137_US',
              'http://GSDServiceWrappers.com/services',
              'TESTCAll_CZ34393137_USResponse',
              'GSDEntitlementServiceWrapper.TESTCAll_CZ34393137_USResponse_element'}
            );
        }
    }
}