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
    func getAllHeroes(callBack: @escaping ([SuperHero]?) -> Void) {
        client?.getAllHeroes(parameters: [:]) { heroes, error in
            if error != nil {
                print(error ?? "error")
                callBack(nil)
                return
            }
            print(heroes.first?.name)
            callBack(heroes)
        }
    }
    
}
