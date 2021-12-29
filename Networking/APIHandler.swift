//
//  APIHandler.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

// MARK: - Errors
struct NetworkError: Error {
    let message: String
}

struct UnknownParseError: Error { }

// MARK: - APIHandler
public protocol RequestHandler {
    
    associatedtype RequestDataType
    
    func makeRequest(from data: RequestDataType) -> Request
}

public protocol ResponseHandler {
    
    associatedtype ResponseDataType
    
    func parseResponse(data: Data) throws -> ResponseDataType
}

public typealias APIHandler = RequestHandler & ResponseHandler


// MARK: - Request
public protocol RequestBuilder {
    func setHeaders(request: inout URLRequest)
}

public class DefaultRequest: RequestBuilder {
    public init() {}
    public func setHeaders(request: inout URLRequest) {
        // header params
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}

public class Request {
    
    private var request: URLRequest
    
    public init(urlRequest: URLRequest, requestBuilder: RequestBuilder) {
        self.request = urlRequest
        // do configuration
        requestBuilder.setHeaders(request: &self.request)
    }
    
    var urlRequest: URLRequest {
        return request
    }
}


// MARK: -
extension RequestHandler {

    /// prepares httpbody
    public func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        // http body
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
    }
}


// MARK: - Response
public protocol Response: Codable {
    //var httpStatus: Int { set get }
}

extension ResponseHandler {
    /// generic response data parser
    public func defaultParseResponse<T: Codable>(data: Data) throws -> T {

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        if let body = try? jsonDecoder.decode(T.self, from: data) {
            return body
        } else {
            throw UnknownParseError()
        }
    }
}
