//
//  HomeModel.swift
//  ChezToto
//
//  Created by Tatiana Simmer on 21/11/2023.
//

import Foundation
import UIKit

struct Dish: Codable {
    let name: String
    let description: String
    let pictureName: String
    let price: Double
}

struct MenuCategory: Codable {
    let name: String
    let dishes: [Dish]
}

class MenuService {
    func getMenu() -> [String: [Dish]]? {
        let jsonData = """
            [
                {
                    "name": "Entrées",
                    "dishes": [
                        {
                            "name": "Garlic bread",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "garlicBread",
                            "price": 3.5
                        },
                        {
                            "name": "Potatoes",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "potatoes",
                            "price": 3.5
                        }
                    ]
                },
                {
                    "name": "Pizzas",
                    "dishes": [
                        {
                            "name": "Margarita",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "margarita",
                            "price": 10
                        },
                        {
                            "name": "Végétarienne",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "vege",
                            "price": 12
                        },
                        {
                            "name": "Peperoni",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "peperoni",
                            "price": 13.5
                        },
                        {
                            "name": "4 fromages",
                            "description": "Du pain légèrement croustillant parfumé à l’ail",
                            "pictureName": "4fromages",
                            "price": 12.5
                        }
                    ]
                }
            ]
            """.data(using: .utf8)!

        
        do {
            let decoder = JSONDecoder()
            let menuCategories = try decoder.decode([MenuCategory].self, from: jsonData)
            var menu: [String: [Dish]] = [:]
            for category in menuCategories {
                menu[category.name] = category.dishes
            }
            return menu
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
}
