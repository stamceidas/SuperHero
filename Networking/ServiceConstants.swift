//
//  ServiceConstants.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

enum Environment {
    
    case development
    
    fileprivate var baseURL: String {
        return "\(urlProtocol)://\(domain)/\(route)"
    }
    
    private var urlProtocol: String {
        switch self {
        case .development:
            return "https"
        }
    }
    
    private var domain: String {
        switch self {
        case .development:
            return "cdn.jsdelivr.net"
        }
    }
    
    private var route: String {
        return "gh/akabab/superhero-api@0.3.0/api"
    }
    
}

extension Environment {
    private var host: String {
        return "\(self.domain)"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.development
#endif

let baseUrl = environment.baseURL

public struct Path {
    
    public struct Hero {
        public init() {}
        
        public var all: URL? { return URL(string: "\(baseUrl)/all.json") }
        
        public var getHero: (Int) -> URL? = { heroID in
            return URL(string: "\(baseUrl)/id/\(String(heroID)).json")
        }
    }
}
