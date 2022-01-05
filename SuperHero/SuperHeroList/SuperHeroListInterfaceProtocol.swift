//
//  SuperHeroListInterfaceProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 4/1/22.
//

import Foundation
import Networking

protocol SuperHeroListInterfaceProtocol {
    func getAllHeroes(parameters: [String: Any], completion: @escaping ([SuperHero], Error?) -> ())
}
