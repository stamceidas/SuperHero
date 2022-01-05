//
//  SuperHeroListInterfaceProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 4/1/22.
//

import Foundation

protocol SuperHeroListInterfaceProtocol {
    func getAllHeroes(parameters: [String: Any], completion: @escaping (Result<[SuperHero], Error>) -> ())
}
