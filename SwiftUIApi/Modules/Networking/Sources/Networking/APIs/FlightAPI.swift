//
// FlightAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class FlightAPI {
    /**
     * enum for parameter sort
     */
    public enum Sort_getFlights: String, CaseIterable {
        case scheduletimeDESC = "-scheduleTime"
        case scheduletimeASC = "+scheduleTime"
    }

    /**
     Get flight
     
     - parameter accept: (header) an authorization header 
     - parameter appId: (header) an authorization header 
     - parameter appKey: (header) an authorization header 
     - parameter resourceVersion: (header) an authorization header 
     - parameter sort: (query) sort 
     - parameter page: (query) Paging (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getFlights(accept: String, appId: String, appKey: String, resourceVersion: String, sort: Sort_getFlights, page: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: FlightList?,_ error: Error?) -> Void)) {
        getFlightsWithRequestBuilder(accept: accept, appId: appId, appKey: appKey, resourceVersion: resourceVersion, sort: sort, page: page).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get flight
     - GET /flights
     - parameter accept: (header) an authorization header 
     - parameter appId: (header) an authorization header 
     - parameter appKey: (header) an authorization header 
     - parameter resourceVersion: (header) an authorization header 
     - parameter sort: (query) sort 
     - parameter page: (query) Paging (optional)
     - returns: RequestBuilder<FlightList> 
     */
    open class func getFlightsWithRequestBuilder(accept: String, appId: String, appKey: String, resourceVersion: String, sort: Sort_getFlights, page: Int? = nil) -> RequestBuilder<FlightList> {
        let path = "/flights"
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

        let requestBuilder: RequestBuilder<FlightList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

}
