//
//  SuperHeroPresenterProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

protocol SuperHeroPresenterProtocol  {
    func attach(_ view: SuperHeroViewProtocol)
//    //Then trafficLightColorSelected will be used to forward the event of selecting a trafic Color from the view to the presenter.
    func loadHeroes()
}
