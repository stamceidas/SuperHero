//
//  SuperHeroDetailPresenterProtocol.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

protocol SuperHeroDetailPresenterProtocol  {
    func attach(_ view: SuperHeroDetailViewProtocol)
//    //Then trafficLightColorSelected will be used to forward the event of selecting a trafic Color from the view to the presenter.
    func loadHero(heroId: Int)
}
