//
//  ViewController.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import UIKit

class MenuViewController: UIViewController {
    var sections: [MenuCategory] = []
    var tableView: UITableView!
    lazy var presenter: Presenter = Presenter(view: self)
    
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Menu"

        tableView = UITableView()
        self.tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.id)
        setupConstraints()
        presenter.getData()
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
        self.sections = [entriesCategory, pizzasCategory]
        tableView.reloadData()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = self.sections[section].dishes
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomCell.id, for: indexPath) as! CustomCell
        let dishes = self.sections[indexPath.section].dishes
        let dish = dishes[indexPath.row]
        
        configureCell(customCell, with: dish)
        return customCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].name
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
