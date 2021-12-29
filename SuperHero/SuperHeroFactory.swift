//
//  SuperHeroFactory.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation
import UIKit

class SuperHeroFactory {
    static func getSuperHeroViewController() -> UIViewController {
        let dataSource =  SuperHeroDataSource.init()
        let presenter = SuperHeroPresenter.init(dataSource: dataSource)
        let vc = SuperHeroViewController.init(with: presenter)
        return vc
    }
}
