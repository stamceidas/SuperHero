//
//  SuperHeroDataSource.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

class SuperHeroDataSource: SuperHeroDataSourceProtocol  {

    let client: SuperHeroListInterfaceProtocol?
   // let environment: EnvironmentProtocol
    
    init(client: SuperHeroListInterfaceProtocol?/*environment: EnvironmentProtocol*/) {
       // self.environment = environment
        self.client = client
    }
    func getAllHeroes(callBack: @escaping (Result<[SuperHero],Error>) -> Void) {
        client?.getAllHeroes(parameters: [:]) { result in
            switch result {
            case .success(let heroes):
                callBack(.success(heroes))
                print(heroes.first?.name)
            case .failure(let error):
                callBack(.failure(error))
            }            
        }
    }
    
}
