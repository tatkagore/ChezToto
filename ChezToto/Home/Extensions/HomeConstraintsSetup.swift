
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
         setupImageView()
         setupTableView()
     }

     func setupImageView() {
         imageView.contentMode = .scaleAspectFill
         imageView.clipsToBounds = true
         imageView.image = UIImage(named: "chezToto")
         view.addSubview(imageView)
     }

     func setupTableView() {
         tableView.dataSource = self
         tableView.delegate = self
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         view.addSubview(tableView)
     }

    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
