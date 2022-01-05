//
//  SuperHeroDetailInterfaceImpl.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 4/1/22.
//

import Foundation
import Networking

final class SuperHeroDetailInterfaceImpl: SuperHeroDetailInterfaceProtocol {
    func getHero(heroID: Int, parameters: [String: Any] = [:], completion: @escaping (SuperHero?, Error?) -> ()) {
        // api
        let api = SuperHeroDetailAPI(heroID: heroID)
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)
        
        apiTaskLoader.loadAPIRequest(requestData: parameters ) { result in
            switch result {
            case .success(let model):
                guard let model = model else { return }
                completion(model , nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
