//
//  SuperHeroDetailPresenter.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation

final class SuperHeroDetailPresenter : SuperHeroDetailPresenterProtocol {
    
    /* Then presenter has two properties :
     The first one is the dataSource. which is owned by the presenter.
     And the second is a weak Refenrece of the view delegate. since the presenter itself will be owned by the view (or the view controller) */
    private let dataSource: SuperHeroDetailDataSourceProtocol
    weak private var view : SuperHeroDetailViewProtocol?
    
    init(dataSource: SuperHeroDetailDataSourceProtocol){
        self.dataSource = dataSource
    }
    
    func attach(_ view: SuperHeroDetailViewProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
        //Not implemented
    }
    
    func loadHero(heroId: Int) {
        dataSource.getHero(heroID: heroId) { result in
            switch result {
            case .success(let hero):
                let uihero = SuperHeroDetailModel(name: hero.name,
                                                  intelligence: String(hero.powerstats.intelligence),
                                                  strength: String(hero.powerstats.strength),
                                                  speed: String(hero.powerstats.speed),
                                                  durability: String(hero.powerstats.durability),
                                                  imageUrl: hero.images.md)
                self.view?.updateView(hero: uihero)
            case .failure(let error):
                print(error)
                return                
            }
            
        }
    }
 
}
