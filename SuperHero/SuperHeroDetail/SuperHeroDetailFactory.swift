//
//  SuperHeroDetailFactory.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation
import UIKit

class SuperHeroDetailFactory {
    static func getSuperHeroDetailViewController(with heroID: Int) -> UIViewController {
        let dataSource =  SuperHeroDetailDataSource.init()
        let presenter = SuperHeroDetailPresenter.init(dataSource: dataSource)
        let vc = SuperHeroDetailViewController.init(with: presenter, heroID: heroID)
        return vc
    }
}
