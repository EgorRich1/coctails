//
//  CoctailCardViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 10.11.22.
//

import SwiftUI

final class CoctailCardViewModel: ObservableObject {
    
    private let cocktail: ShortDrinkModel
    @Published var isLiked: Bool = false
    private let databaseService: DatabaseServiceProtocol
    
    init(
        cocktail: ShortDrinkModel,
        databaseService: DatabaseServiceProtocol = DatabaseService.shared
    ) {
        self.cocktail = cocktail
        self.databaseService = databaseService
        if cocktail.drinkId == "15395" {
            print(123123142124)
        }
    }
    
    private func checkIfItAlreadyLike() -> Bool {
        let likedCocktails = databaseService.getListOfFavoriteCocktails()
        return likedCocktails.contains(where: {$0.drinkId == cocktail.drinkId})
    }
    
    func setupState() {
        let a = checkIfItAlreadyLike()
        if a != isLiked {
            isLiked = a
        }
    }
    
    func updateLikeState() {
        isLiked.toggle()
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
