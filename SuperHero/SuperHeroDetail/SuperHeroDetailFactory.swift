//
//  SuperHeroDetailFactory.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation
import UIKit

class SuperHeroDetailFactoryImpl: SuperHeroDetailFactoryProtocol {
    func getSuperHeroDetailViewController(with heroID: Int) -> UIViewController {
        let clientImpl = SuperHeroDetailInterfaceImpl()
        let dataSource =  SuperHeroDetailDataSource.init(client: clientImpl)
        let presenter = SuperHeroDetailPresenter.init(dataSource: dataSource)
        let vc = SuperHeroDetailViewController.init(with: presenter, heroID: heroID)
        return vc
    }
}
