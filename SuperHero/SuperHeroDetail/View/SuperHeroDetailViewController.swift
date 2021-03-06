//
//  SuperHeroDetailViewController.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 29/12/21.
//

import Foundation
import UIKit
import Kingfisher

class SuperHeroDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var intelligenceLbl: UILabel!
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var durabilityLbl: UILabel!

    let presenter: SuperHeroDetailPresenterProtocol
    let heroID: Int
    
    required init(with presenter: SuperHeroDetailPresenterProtocol, heroID: Int) {
        self.presenter = presenter
        self.heroID = heroID
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.attach(self)
        self.presenter.loadHero(heroId: heroID )
    }
}

extension SuperHeroDetailViewController: SuperHeroDetailViewProtocol {
    func updateView(hero: SuperHeroDetailModel) {
        self.nameLbl.text = hero.name
        self.intelligenceLbl.text = hero.intelligence
        self.strengthLbl.text = hero.strength
        self.speedLbl.text = hero.speed
        self.durabilityLbl.text = hero.durability
        self.imageView.kf.setImage(with: URL(string: hero.imageUrl))
        self.title = hero.name
    }
}
