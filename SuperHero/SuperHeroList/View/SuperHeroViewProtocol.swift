//
//  SuperViewProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

/**We will use it when ever we want to pass an information from the presenter to the view. Here it will allow to send the information back to the view controller **/
protocol SuperHeroViewProtocol: NSObjectProtocol {
    func updateView(heroes: [SuperHeroCellModel]) -> Void
}
