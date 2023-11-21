//
//  HomeModel.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation

struct RestaurantTiming {
    let day: String
    let schedule: String
}

struct Restaurant {
    let timings: [RestaurantTiming]
    let address: String
    let website: String
    let phoneNumber: String
}

class RestaurantService {
    func getRestaurant() -> Restaurant {
        let timings = [
            RestaurantTiming(day: "Lundi", schedule: "Fermé"),
            RestaurantTiming(day: "Mardi", schedule: "11h30 - 14h30・18h30 - 22h00"),
            RestaurantTiming(day: "Mercredi", schedule: "11h30 - 14h30・18h30 - 22h00"),
            RestaurantTiming(day: "Jeudi", schedule: "11h30 - 14h30・18h30 - 22h00"),
            RestaurantTiming(day: "Vendredi", schedule: "11h30 - 14h30・18h30 - 22h00"),
            RestaurantTiming(day: "Samedi", schedule: "11h30 - 14h30・18h30 - 22h00"),
            RestaurantTiming(day: "Dimanche", schedule: "Fermé")
        ]
        
        let address = "12 Rue Tolbiac - 75013 Paris"
        let website = "www.cheztotopizza.fr"
        let phoneNumber = "06 12 34 56 78"
        
        let restaurant = Restaurant(timings: timings, address: address, website: website, phoneNumber: phoneNumber)
        return restaurant
    }
}
