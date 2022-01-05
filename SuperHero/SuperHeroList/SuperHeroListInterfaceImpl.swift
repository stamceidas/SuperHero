//
//  SuperHeroListInterfaceImpl.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

final class SuperHeroListInterfaceImpl: SuperHeroListInterfaceProtocol {

    func getAllHeroes(parameters: [String: Any] = [:], completion: @escaping ([SuperHero], Error?) -> ()){
        // api
        let api = SuperHeroAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)
        
        apiTaskLoader.loadAPIRequest(requestData: parameters) { result in
            switch result {
            case .success(let model):
                guard let model = model else {
                    completion([], nil)
                    return
                }
                completion(model.filter{ $0.id <= 20 }, nil)
            case .failure(let error):
                completion([], error)
            }
        }
    }
}
