//
//  SuperHeroServices.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

class SuperHeroServices {
    func getAllHeroes(parameters: [String: Any]? = [:], completion: @escaping ([RootElement]?, Error?) -> ()) {
        // api
        let api = SuperHeroAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)
        
        apiTaskLoader.loadAPIRequest(requestData: parameters ?? [:]) { (result, error) in
            completion(result ?? [], error)
        }
    }
}
