//
//  Drink.swift
//  Cocktails
//
//  Created by Егор Ярошук on 24.11.22.
//

import Foundation

final class Drink: Decodable, Identifiable {
    let id = UUID()
    let drinkId: String
    let drinkName: String
    let drinkAlternate: String?
    let tags: String?
    let videoLink: String?
    let category: String
    let iba: String?
    let alcoholic: String
    let glass: String
    let instructions: String
    let drinkImageUrl: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredients: [String]
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measures: [String]
    
    private enum CodingKeys: String, CodingKey {
        case drinkId = "idDrink"
        case drinkName = "strDrink"
        case drinkAlternate = "strDrinkAlternate"
        case tags = "strTags"
        case videoLink = "strVideo"
        case category = "strCategory"
        case iba = "strIBA"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case drinkImageUrl = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        drinkId = try container.decode(String.self, forKey: .drinkId)
        drinkName = try container.decode(String.self, forKey: .drinkName)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        videoLink = try container.decodeIfPresent(String.self, forKey: .videoLink)
        category = try container.decode(String.self, forKey: .category)
        iba = try container.decodeIfPresent(String.self, forKey: .iba)
        alcoholic = try container.decode(String.self, forKey: .alcoholic)
        glass = try container.decode(String.self, forKey: .glass)
        instructions = try container.decode(String.self, forKey: .instructions)
        drinkImageUrl = try container.decode(String.self, forKey: .drinkImageUrl)
        var ingridientsOptional: [String?] = []
        ingredient1 = try container.decodeIfPresent(String.self, forKey: .ingredient1)
        ingridientsOptional.append(ingredient1)
        ingredient2 = try container.decodeIfPresent(String.self, forKey: .ingredient2)
        ingridientsOptional.append(ingredient2)
        ingredient3 = try container.decodeIfPresent(String.self, forKey: .ingredient3)
        ingridientsOptional.append(ingredient3)
        ingredient4 = try container.decodeIfPresent(String.self, forKey: .ingredient4)
        ingridientsOptional.append(ingredient4)
        ingredient5 = try container.decodeIfPresent(String.self, forKey: .ingredient5)
        ingridientsOptional.append(ingredient5)
        ingredient6 = try container.decodeIfPresent(String.self, forKey: .ingredient6)
        ingridientsOptional.append(ingredient6)
        ingredient7 = try container.decodeIfPresent(String.self, forKey: .ingredient7)
        ingridientsOptional.append(ingredient7)
        ingredient8 = try container.decodeIfPresent(String.self, forKey: .ingredient8)
        ingridientsOptional.append(ingredient8)
        ingredient9 = try container.decodeIfPresent(String.self, forKey: .ingredient9)
        ingridientsOptional.append(ingredient9)
        ingredient10 = try container.decodeIfPresent(String.self, forKey: .ingredient10)
        ingridientsOptional.append(ingredient10)
        ingredient11 = try container.decodeIfPresent(String.self, forKey: .ingredient11)
        ingridientsOptional.append(ingredient11)
        ingredient12 = try container.decodeIfPresent(String.self, forKey: .ingredient12)
        ingridientsOptional.append(ingredient12)
        ingredient13 = try container.decodeIfPresent(String.self, forKey: .ingredient13)
        ingridientsOptional.append(ingredient13)
        ingredient14 = try container.decodeIfPresent(String.self, forKey: .ingredient14)
        ingridientsOptional.append(ingredient14)
        ingredient15 = try container.decodeIfPresent(String.self, forKey: .ingredient15)
        ingridientsOptional.append(ingredient15)
        ingredients = ingridientsOptional.compactMap({$0})
        var measurisOptional: [String?] = []
        measure1 = try container.decodeIfPresent(String.self, forKey: .measure1)
        measurisOptional.append(measure1)
        measure2 = try container.decodeIfPresent(String.self, forKey: .measure2)
        measurisOptional.append(measure2)
        measure3 = try container.decodeIfPresent(String.self, forKey: .measure3)
        measurisOptional.append(measure3)
        measure4 = try container.decodeIfPresent(String.self, forKey: .measure4)
        measurisOptional.append(measure4)
        measure5 = try container.decodeIfPresent(String.self, forKey: .measure5)
        measurisOptional.append(measure5)
        measure6 = try container.decodeIfPresent(String.self, forKey: .measure6)
        measurisOptional.append(measure6)
        measure7 = try container.decodeIfPresent(String.self, forKey: .measure7)
        measurisOptional.append(measure7)
        measure8 = try container.decodeIfPresent(String.self, forKey: .measure8)
        measurisOptional.append(measure8)
        measure9 = try container.decodeIfPresent(String.self, forKey: .measure9)
        measurisOptional.append(measure9)
        measure10 = try container.decodeIfPresent(String.self, forKey: .measure10)
        measurisOptional.append(measure10)
        measure11 = try container.decodeIfPresent(String.self, forKey: .measure11)
        measurisOptional.append(measure11)
        measure12 = try container.decodeIfPresent(String.self, forKey: .measure12)
        measurisOptional.append(measure12)
        measure13 = try container.decodeIfPresent(String.self, forKey: .measure13)
        measurisOptional.append(measure13)
        measure14 = try container.decodeIfPresent(String.self, forKey: .measure14)
        measurisOptional.append(measure14)
        measure15 = try container.decodeIfPresent(String.self, forKey: .measure15)
        measurisOptional.append(measure15)
        measures = measurisOptional.compactMap({$0})
    }
}
