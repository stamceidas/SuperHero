//
//  SuperHeroDetailsDataSourceProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

protocol SuperHeroDetailDataSourceProtocol {
    func getHero(heroID: Int, callBack: @escaping (Result<SuperHero, Error>) -> Void)
}
