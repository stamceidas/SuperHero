//
//  APILoader.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

public class APILoader<T: APIHandler> {
    
    let apiRequest: T
    
    let urlSession: URLSession
    
    
    public init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    public func loadAPIRequest(requestData: T.RequestDataType,
                        completionHandler: @escaping (Result<T.ResponseDataType, Error>) -> ()) {

        // prepare url request
        let urlRequest = apiRequest.makeRequest(from: requestData).urlRequest
        // do session task
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            // parse response
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: data)
                DispatchQueue.main.async {
                    completionHandler(.success(parsedResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
