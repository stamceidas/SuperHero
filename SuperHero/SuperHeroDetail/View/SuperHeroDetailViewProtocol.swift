//
//  SuperHeroDetailViewProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

/**We will use it when ever we want to pass an information from the presenter to the view. Here it will allow to send the information back to the view controller **/
protocol SuperHeroDetailViewProtocol: NSObjectProtocol {
    func updateView(hero: SuperHeroDetailModel) -> Void
}
