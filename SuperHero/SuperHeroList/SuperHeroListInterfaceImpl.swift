//
//  SuperHeroListInterfaceImpl.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

final class SuperHeroListInterfaceImpl: SuperHeroListInterfaceProtocol {

    func getAllHeroes(parameters: [String: Any] = [:], completion: @escaping (Result<[SuperHero], Error>) -> ()){
        // api
        let api = SuperHeroAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)
        
        apiTaskLoader.loadAPIRequest(requestData: parameters) { result in
            switch result {
            case .success(let model):
                completion(.success(model.filter{ $0.id <= 20 }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
