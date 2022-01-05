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
        let client = SuperHeroListInterfaceImpl()
        let dataSource =  SuperHeroDataSource.init(client: client)
        let presenter = SuperHeroPresenter.init(dataSource: dataSource)
        let detailFactory = SuperHeroDetailFactoryImpl()
        let vc = SuperHeroViewController.init(with: presenter, detailFactory: detailFactory)
        return vc
    }
}
