//
//  HomeCustomCell.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

class RestaurantCell: UITableViewCell {
    static let id = "customCell"

    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let workingHoursLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let watchIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "watch"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(workingHoursLabel)
        contentView.addSubview(watchIconImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            watchIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            watchIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            watchIconImageView.widthAnchor.constraint(equalToConstant: 20),
            watchIconImageView.heightAnchor.constraint(equalToConstant: 20),

            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: watchIconImageView.trailingAnchor, constant: 8),

            workingHoursLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            workingHoursLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
