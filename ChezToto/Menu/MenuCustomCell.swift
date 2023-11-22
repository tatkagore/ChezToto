//
//  MenuCustomCell.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    static let id = "CustomTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let dishName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let dishDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let dishPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.addSubview(dishImageView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(dishName)
        stackView.addArrangedSubview(dishDescription)
        stackView.addArrangedSubview(dishPrice)
        
        contentView.addSubview(containerView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dishImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dishImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dishImageView.widthAnchor.constraint(equalToConstant: 120),
            dishImageView.heightAnchor.constraint(equalTo: dishImageView.widthAnchor, multiplier: 1.0), // Maintain aspect ratio
            dishImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            let margin: CGFloat = 10
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin))
            contentView.layer.cornerRadius = 15
            contentView.layer.masksToBounds = true
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor(ciColor: .gray).withAlphaComponent(0.5).cgColor
        }
}


