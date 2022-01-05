//
//  SuperHeroDetailFactoryProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 4/1/22.
//

import Foundation
import UIKit

protocol SuperHeroDetailFactoryProtocol {
    func getSuperHeroDetailViewController(with heroID: Int) -> UIViewController
}
