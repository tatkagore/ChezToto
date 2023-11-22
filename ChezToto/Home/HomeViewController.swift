//
//  HomeViewController.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let bannerImageView = UIImageView()
    let mapImageView = UIImageView()
    let tableView = UITableView()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()

    let menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        menuButton.setTitle("Accéder au menu", for: .normal)
        menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        menuButton.setTitleColor(.white, for: .normal)
        menuButton.backgroundColor = UIColor(named: "myRed")
        menuButton.layer.cornerRadius = 8
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return menuButton
    }()
    
    var restaurant: Restaurant = Restaurant(timings: [], address: "", website: "", phoneNumber: "")
    lazy var presenter: HomePresenter = HomePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        view.backgroundColor = .white
        
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.id)
        presenter.getData()
        setupViews()
        setupConstraints()
    }
    
    @objc func menuButtonTapped() {
            let menuViewController = MenuViewController()
            navigationController?.pushViewController(menuViewController, animated: true)
            }
}



extension HomeViewController: HomeViewPresenter {
    func getData(data: [Restaurant]) {
        restaurant = data[0]
        addressLabel.text = restaurant.address
        websiteLabel.text = restaurant.website
        phoneNumberLabel.text = restaurant.phoneNumber
        tableView.reloadData()
        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.timings.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.id, for: indexPath) as! RestaurantCell
        let timing = restaurant.timings[indexPath.row]
        cell.dayLabel.text = timing.day
        cell.workingHoursLabel.text = timing.schedule
        return cell
    }
}
