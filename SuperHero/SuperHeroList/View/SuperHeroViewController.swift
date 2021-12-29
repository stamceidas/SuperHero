//
//  SuperHeroViewController.swift
//  SuperHero
//
//  Created by STROUMPIS Stamatios on 27/12/21.
//

import UIKit
import Kingfisher

class SuperHeroViewController: UIViewController, UITableViewDelegate {


    let presenter: SuperHeroPresenterProtocol
    
    required init(with presenter: SuperHeroPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var heroes: [RootElement] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()        
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
        cell.imageView?.kf.setImage(with: URL(string: hero.images.xs)) { result in
            cell.setNeedsLayout()
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension SuperHeroViewController: SuperHeroViewProtocol {
    func displayTrafficLight(description: String) {
        return
    }
    
    func updateView(heroes: [RootElement]) {
        self.heroes = heroes
    }
}

extension SuperHeroViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.heroSelected(id: heroes[indexPath.row].id)
    }
}
