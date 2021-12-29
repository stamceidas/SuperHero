//
//  SuperHeroDataSource.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import Networking

class SuperHeroDataSource: SuperHeroDataSourceProtocol  {
    
   // let environment: EnvironmentProtocol
    
    init(/*environment: EnvironmentProtocol*/) {
       // self.environment = environment
    }
    func getAllHeroes(callBack: @escaping ([RootElement]?) -> Void) {
        SuperHeroServices().getAllHeroes { heroes, error in
            guard let heroes = heroes else {
                print(error ?? "error")
                callBack(nil)
                return
            }
            print(heroes.first?.name)
            callBack(heroes.filter{ $0.id < 20})
        }
    }
    
}
