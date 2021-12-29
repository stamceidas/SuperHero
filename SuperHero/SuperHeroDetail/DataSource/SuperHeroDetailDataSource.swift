//
//  SuperHeroDetailDataSource.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

class SuperHeroDetailDataSource: SuperHeroDetailDataSourceProtocol  {
    
    // let environment: EnvironmentProtocol
    
    init(/*environment: EnvironmentProtocol*/) {
        // self.environment = environment
    }
    func getHero(heroID: Int, callBack: @escaping (RootElement?) -> Void) {
        SuperHeroServices().getHero(heroID: heroID) { heroes, error in
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
