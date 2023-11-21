//
//  MenuConstraintsSetup.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//
import UIKit
extension MenuViewController {
    func setupConstraints() {
        // Create main stack view
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical // Main stack view is vertical

        // Create horizontal stack view for entries and pizzas
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical // Entries and Pizzas are arranged horizontally
        verticalStackView.distribution = .fillEqually

        // Add Entries TableView to the horizontal stack view
        guard let entriesTableView = entriesTableView else { return }
        entriesTableView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(entriesTableView)

        // Add Pizzas TableView to the horizontal stack view
        guard let pizzasTableView = pizzasTableView else { return }
        pizzasTableView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(pizzasTableView)

        // Add the horizontal stack view to the main stack view
        mainStackView.addArrangedSubview(verticalStackView)

        view.addSubview(mainStackView)

        // Set constraints for main stack view
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
