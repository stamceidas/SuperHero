//
//  SuperHeroDataSourceProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

protocol SuperHeroDataSourceProtocol {
        func getAllHeroes(callBack: @escaping (Result<[SuperHero],Error>) -> Void)
}
