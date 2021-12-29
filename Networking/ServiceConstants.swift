//
//  ServiceConstants.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

enum Environment {
    
    case development
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(domain())/\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .development:
            return "https"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "cdn.jsdelivr.net"
        }
    }
    
    func route() -> String {
        return "gh/akabab/superhero-api@0.3.0/api"
    }
    
}

extension Environment {
    func host() -> String {
        return "\(self.domain())"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.development
#endif

let baseUrl = environment.baseURL()

public struct Path {
    
    public init() {}
    public var all: String { return "\(baseUrl)/all.json" }
    
    struct User {
        
        var getProfile: String { return "\(baseUrl)/profile" }
        
        var deleteUser: (Int) -> String = { userID in
            return "\(baseUrl)/profile/\(String(userID))"
        }
        
        struct Task {
            
            var getTasks: String { return "\(baseUrl)/tasks" }
            
            var getTaskDetail: (Int, Int) -> String = { userID, taskID in
                return "\(baseUrl)/profile/\(String(userID))/task/\(String(taskID))"
            }
            
        }
    }
}
