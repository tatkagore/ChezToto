//
//  ViewController.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import UIKit

class MenuViewController: UIViewController {
    var pizzas: [MenuCategory] = []
    var entries: [MenuCategory] = []
    lazy var presenter: Presenter = Presenter(view: self)
    
    var pizzasTableView: UITableView!
    var entriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pizzasTableView = UITableView()
        entriesTableView = UITableView()
        
        if let pizzasTableView = pizzasTableView, let entriesTableView = entriesTableView {
            view.addSubview(pizzasTableView)
            view.addSubview(entriesTableView)
            
            // Set delegates and data sources
            pizzasTableView.delegate = self
            pizzasTableView.dataSource = self
            entriesTableView.delegate = self
            entriesTableView.dataSource = self
            
            // Register custom cell for both table views
            pizzasTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.id)
            entriesTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.id)
            
            // Position and size the table views within the view hierarchy
            setupConstraints() // Calling the constraints setup from MenuConstraintsSetup.swift
            
            // Set table view headers
            pizzasTableView.tableHeaderView = createTableHeaderView(title: "Pizzas") // Calling createTableHeaderView from MenuTableHeaders.swift
            entriesTableView.tableHeaderView = createTableHeaderView(title: "Entrées") // Calling createTableHeaderView from MenuTableHeaders.swift
            
            presenter.getData()
        } else {
            print("Error: Unable to create table views")
        }
    }
}

extension MenuViewController: ViewPresenter {
    func getData(data: [String : [Dish]]) {
        guard let pizzas = data["Pizzas"], let entries = data["Entrées"] else {
            print("Error: Missing menu categories")
            return
        }
        
        let pizzasCategory = MenuCategory(name: "Pizzas", dishes: pizzas)
        let entriesCategory = MenuCategory(name: "Entrées", dishes: entries)
        
        self.pizzas = [pizzasCategory]
        self.entries = [entriesCategory]
        
        pizzasTableView.reloadData()
        entriesTableView.reloadData()
    }
    
    func getData(data: [MenuCategory]) {
        // Implement this if you need to handle an array of MenuCategory objects
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == pizzasTableView {
            return pizzas.count > 0 ? pizzas[0].dishes.count : 0
        } else if tableView == entriesTableView {
            return entries.count > 0 ? entries[0].dishes.count : 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomCell.id, for: indexPath) as! CustomCell
        
        if tableView == pizzasTableView {
            if pizzas.indices.contains(0), pizzas[0].dishes.indices.contains(indexPath.row) {
                let dish = pizzas[0].dishes[indexPath.row]
                configureCell(customCell, with: dish)
            }
        } else if tableView == entriesTableView {
            if entries.indices.contains(0), entries[0].dishes.indices.contains(indexPath.row) {
                let dish = entries[0].dishes[indexPath.row]
                configureCell(customCell, with: dish)
            }
        }
        
        return customCell
    }
    
    private func configureCell(_ cell: CustomCell, with dish: Dish) {
        cell.dishName.text = dish.name
        cell.dishDescription.text = dish.description
        cell.dishPrice.text = "$\(dish.price)"
        
        // Set dish image based on pictureName
        let imageName = dish.pictureName
        cell.dishImageView.image = UIImage(named: imageName)
    }
}
