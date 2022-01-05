//
//  SuperHeroPresenter.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import Foundation

final class SuperHeroPresenter : SuperHeroPresenterProtocol {
    
    /* Then presenter has two properties :
     The first one is the dataSource. which is owned by the presenter.
     And the second is a weak Refenrece of the view delegate. since the presenter itself will be owned by the view (or the view controller) */
    private let dataSource: SuperHeroDataSourceProtocol
    weak private var view : SuperHeroViewProtocol?
    
    init(dataSource: SuperHeroDataSourceProtocol){
        self.dataSource = dataSource
    }
    
    func attach(_ view: SuperHeroViewProtocol) {
        assert(self.view == nil, "Cannot attach view twice")
        self.view = view
        //Not implemented
    }
    
    func loadHeroes() {
        dataSource.getAllHeroes { heroes in
            var uiheroes: [SuperHeroCellModel] = []
            heroes?.forEach{ hero in
                let hero = SuperHeroCellModel(id: hero.id, name: hero.name, imageUrl: hero.images.xs)
                uiheroes.append(hero)
            }
            self.view?.updateView(heroes: uiheroes)
        }
    }
 
}
