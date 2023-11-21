//
//  HomeViewController.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let imageView = UIImageView()
    let tableView = UITableView()
    
    var restaurant: Restaurant = Restaurant(timings: [], address: "", website: "", phoneNumber: "")
    lazy var presenter: HomePresenter = HomePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.id)
        presenter.getData()
        setupViews()
        setupConstraints()
    }
}

extension HomeViewController: HomeViewPresenter {
    func getData(data: [Restaurant]) {
        // Receive restaurant data from presenter
        restaurant = data[0]
        tableView.reloadData() // Refresh the table view with new data
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.timings.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.id, for: indexPath) as! RestaurantCell
        let timing = restaurant.timings[indexPath.row]
        
        // Configure cell with restaurant data
        cell.dayLabel.text = timing.day
        cell.workingHoursLabel.text = timing.schedule
        print( restaurant)
        return cell
    }
}
