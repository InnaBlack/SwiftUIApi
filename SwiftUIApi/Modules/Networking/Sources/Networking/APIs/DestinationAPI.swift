//
// DestinationAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class DestinationAPI {
    /**
     * enum for parameter sort
     */
    public enum Sort_getDestinations: String, CaseIterable {
        case publicnameDutchASC = "+publicName.dutch"
        case publicnameDutchDESC = "-publicName.dutch"
    }

    /**
     Get destination
     
     - parameter accept: (header) an authorization header 
     - parameter appId: (header) an authorization header 
     - parameter appKey: (header) an authorization header 
     - parameter resourceVersion: (header) an authorization header 
     - parameter sort: (query) sort 
     - parameter page: (query) Paging (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDestinations(accept: String, appId: String, appKey: String, resourceVersion: String, sort: Sort_getDestinations, page: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: DestinationList?,_ error: Error?) -> Void)) {
        getDestinationsWithRequestBuilder(accept: accept, appId: appId, appKey: appKey, resourceVersion: resourceVersion, sort: sort, page: page).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get destination
     - GET /destinations
     - parameter accept: (header) an authorization header 
     - parameter appId: (header) an authorization header 
     - parameter appKey: (header) an authorization header 
     - parameter resourceVersion: (header) an authorization header 
     - parameter sort: (query) sort 
     - parameter page: (query) Paging (optional)
     - returns: RequestBuilder<DestinationList> 
     */
    open class func getDestinationsWithRequestBuilder(accept: String, appId: String, appKey: String, resourceVersion: String, sort: Sort_getDestinations, page: Int? = nil) -> RequestBuilder<DestinationList> {
        let path = "/destinations"
        let URLString = OpenAPIClientAPI.baseSchipholPath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "sort": sort.encodeToJSON(), 
            "page": page?.encodeToJSON()
        ])
        let nillableHeaders: [String: Any?] = [
            "Accept": accept.encodeToJSON(),
            "app_id": appId.encodeToJSON(),
            "app_key": appKey.encodeToJSON(),
            "ResourceVersion": resourceVersion.encodeToJSON()
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<DestinationList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

}
