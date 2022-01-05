//
//  SuperHeroViewController.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import UIKit
import Kingfisher

class SuperHeroViewController: UIViewController, UITableViewDelegate {


    private let presenter: SuperHeroPresenterProtocol
    private let detailFactory: SuperHeroDetailFactoryProtocol?
    
    required init(with presenter: SuperHeroPresenterProtocol, detailFactory: SuperHeroDetailFactoryProtocol?) {
        self.presenter = presenter
        self.detailFactory = detailFactory
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var heroes: [SuperHeroCellModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        self.title = "Super Heroes"
        self.presenter.attach(self)
        self.presenter.loadHeroes()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension SuperHeroViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        cell.imageView?.kf.setImage(with: URL(string: hero.imageUrl)) { result in
            cell.setNeedsLayout()
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: View Protocol
extension SuperHeroViewController: SuperHeroViewProtocol {
    func displayTrafficLight(description: String) {
        return
    }
    
    func updateView(heroes: [SuperHeroCellModel]) {
        self.heroes = heroes
    }
}

// MARK: Navigation
extension SuperHeroViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroID = heroes[indexPath.row].id
        navigateToDetailView(heroID: heroID)
    }
    
    func navigateToDetailView(heroID: Int) {
        guard let detailVC = detailFactory?.getSuperHeroDetailViewController(with: heroID)
            else { return }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
