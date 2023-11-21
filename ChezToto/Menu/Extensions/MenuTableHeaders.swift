//
//  MenuTableHeaders.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

extension MenuViewController {
    func createTableHeaderView(title: String) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 8, width: view.bounds.width - 32, height: 24))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = title
        headerView.addSubview(titleLabel)
        return headerView
    }
}
