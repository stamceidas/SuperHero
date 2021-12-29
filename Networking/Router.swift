//
//  Router.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

enum Router {
    // 1.
    case getSources
    case getProductIds
    case getProductInfo
    
    // 2.
    var scheme: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "https"
        }
    }
    
    // 3.
    var host: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "shopicruit.myshopify.com"
        }
    }
    
    // 4.
    var path: String {
        switch self {
        case .getSources:
            return "/admin/custom_collections.json"
        case .getProductIds:
            return "/admin/collects.json"
        case .getProductInfo:
            return "/admin/products.json"
        }
    }
    
    // 5.
    var parameters: [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self {
        case .getSources:
            // 6.
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        case .getProductIds:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "collection_id", value: "68424466488"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        case .getProductInfo:
            return [URLQueryItem(name: "ids", value: "2759162243,2759143811"),
                    URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        }
    }
    
    var method: HTTPMethod {
      switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return .get
      }
    }
}
