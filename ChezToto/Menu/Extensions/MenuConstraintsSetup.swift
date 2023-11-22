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
        mainStackView.axis = .vertical

        // Create  vertical stack view for entries and pizzas
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
        
        // Add Entries TableView to the horizontal stack view
        guard let tableView = tableView else { return }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(tableView)

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
