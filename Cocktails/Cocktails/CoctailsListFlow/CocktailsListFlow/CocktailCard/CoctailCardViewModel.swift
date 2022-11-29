//
//  CoctailCardViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 10.11.22.
//

import SwiftUI

class CoctailCardViewModeling: ObservableObject {
    func updateLikeState(isLiked: Bool) {}
}

final class CoctailCardViewModel: CoctailCardViewModeling {
    
    private let cocktail: ShortDrinkModel
    private let databaseService: DatabaseService
    
    init(
        cocktail: ShortDrinkModel,
        databaseService: DatabaseService = DatabaseService.shared
    ) {
        self.cocktail = cocktail
        self.databaseService = databaseService
    }
    
    override func updateLikeState(isLiked: Bool) {
        if isLiked {
            databaseService.writeCocktail(shortCocktail: cocktail) {
                print("Write success")
            }
        } else {
            databaseService.removeCocktail(by: cocktail.drinkId) { result in
                switch result {
                case .success:
                    print("Removed")
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
