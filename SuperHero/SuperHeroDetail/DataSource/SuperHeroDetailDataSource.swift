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
    func getHero(heroID: Int, callBack: @escaping (SuperHero?) -> Void) {
        client?.getHero(heroID: heroID, parameters: [:]) { heroes, error in
            guard let heroe = heroes else {
                print(error ?? "error")
                callBack(nil)
                return
            }
            print(heroe.name)
            callBack(heroe)
        }
    }
    
}
