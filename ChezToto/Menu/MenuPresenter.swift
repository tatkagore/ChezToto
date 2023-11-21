//
//  MenuPresenter.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation

class Presenter {
    let menuService = MenuService()
    let view: ViewPresenter
    
    init(view: ViewPresenter) {
        self.view = view
    }
    
    func getData() {
        if let menu = menuService.getMenu() {
            // Handle dictionary data here
            self.view.getData(data: menu)
        } else {
            // Handle error or absence of data
            self.view.getData(data: [:]) // Sending an empty dictionary as an example
        }
    }
}

protocol ViewPresenter {
    func getData(data: [String: [Dish]])
}
