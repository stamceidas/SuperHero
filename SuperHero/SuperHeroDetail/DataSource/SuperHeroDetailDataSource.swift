//
//  SuperHeroDetailDataSource.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

class SuperHeroDetailDataSource: SuperHeroDetailDataSourceProtocol  {
    
    private let client: SuperHeroDetailInterfaceProtocol?

    // let environment: EnvironmentProtocol
    
    init(client: SuperHeroDetailInterfaceProtocol?/*environment: EnvironmentProtocol*/) {
        // self.environment = environment
        self.client = client
    }
    func getHero(heroID: Int, callBack: @escaping (Result<SuperHero, Error>) -> Void) {
        client?.getHero(heroID: heroID, parameters: [:]) { result in
            switch result {
            case .success(let model):
                callBack(.success(model))
            case .failure(let error):
                callBack(.failure(error))
            }
        }
    }
    
}
