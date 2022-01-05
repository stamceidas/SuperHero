//
//  SuperHeroDetailInterfaceProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 4/1/22.
//
import Foundation

protocol SuperHeroDetailInterfaceProtocol {
    func getHero(heroID: Int, parameters: [String: Any], completion: @escaping (Result<SuperHero, Error>) -> ())
}
