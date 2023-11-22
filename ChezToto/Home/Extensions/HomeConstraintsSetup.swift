
//
//  HomeConstraintsSetup.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    func setupViews() {
        setupBannerImageView()
        setupTableView()
        setupMapImageView()
        setupMenuButton()
    }
    
    func setupBannerImageView() {
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.image = UIImage(named: "chezToto")
        view.addSubview(bannerImageView)
    }
    func setupMapImageView() {
        mapImageView.contentMode = .scaleAspectFill
        mapImageView.clipsToBounds = true
        mapImageView.image = UIImage(named: "map")
        mapImageView.layer.cornerRadius = 10
        mapImageView.clipsToBounds = true
        view.addSubview(mapImageView)
    }
    
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    
    func setupMenuButton() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: mapImageView.bottomAnchor, constant: 10),
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            menuButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupConstraints() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 320),
        ])
        
        let labelsStackView = UIStackView(arrangedSubviews: [addressLabel, websiteLabel, phoneNumberLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
              mapImageView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 10),
              mapImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
              mapImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              mapImageView.heightAnchor.constraint(equalToConstant: 130),
              mapImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -10),
              mapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
    }
}
