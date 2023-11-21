//
//  HomePresenter.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation

class HomePresenter {
    let restaurantService = RestaurantService()
    let view: HomeViewPresenter
    
    init(view: HomeViewPresenter) {
        self.view = view
    }
    
    func getData() {
        let restaurant = restaurantService.getRestaurant()
        self.view.getData(data: [restaurant])
    }
}

protocol HomeViewPresenter {
    func getData(data: [Restaurant])
}
