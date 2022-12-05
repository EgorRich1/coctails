//
//  DBShortCocktail.swift
//  Cocktails
//
//  Created by Егор Ярошук on 29.11.22.
//

import RealmSwift

final class DBShortCocktail: Object {
    @Persisted var drinkId: String
    @Persisted var imageUrl: String
    @Persisted var title: String
    
    convenience init(shortDrink: ShortDrinkModel) {
        self.init()
        
        self.drinkId = shortDrink.drinkId
        self.imageUrl = shortDrink.imageUrl
        self.title = shortDrink.drink
    }
    
    override class func primaryKey() -> String? {
        "drinkId"
    }
}
