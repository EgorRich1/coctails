//
//  ShortDrinkModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 8.11.22.
//

import Foundation

final class ShortDrinkModel: Decodable, Identifiable {
    let id = UUID()
    let drink: String
    let imageUrl: String
    let drinkId: String
    
    private enum CodingKeys: String, CodingKey {
        case drink = "strDrink"
        case imageUrl = "strDrinkThumb"
        case drinkId = "idDrink"
    }
    
    init(name: String, imageUrl: String, drinkId: String) {
        self.drink = name
        self.imageUrl = imageUrl
        self.drinkId = drinkId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        drink = try container.decode(String.self, forKey: .drink)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        drinkId = try container.decode(String.self, forKey: .drinkId)
    }
}
