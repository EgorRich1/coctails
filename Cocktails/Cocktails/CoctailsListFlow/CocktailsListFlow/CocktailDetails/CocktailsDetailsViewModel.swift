//
//  CocktailsDetailsViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 22.11.22.
//

import SwiftUI

final class CocktailsDetailsViewModel: ObservableObject {
    // MARK: - Private properties
    
    private let networkServise: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    private let drinkId: String
    @Published var isLiked: Bool = false
    @Published var drink: Drink?
    
    // MARK: - Init
    
    init(
        drinkId: String,
        networkServise: NetworkServiceProtocol = NetworkService.shared,
        databaseService: DatabaseServiceProtocol = DatabaseService.shared
    ) {
        self.drinkId = drinkId
        self.networkServise = networkServise
        self.databaseService = databaseService
    }
    
    // MARK: - Private methods
    
    private func checkIfItAlreadyLike() -> Bool {
        let likedCocktails = databaseService.getListOfFavoriteCocktails()
        return likedCocktails.contains(where: {$0.drinkId == drinkId})
    }
    
    @MainActor
    private func updateDrink(drink: Drink) {
        self.drink = drink
    }
    
    // MARK: - Public methods
    
    func setupState() {
        let isLiked = checkIfItAlreadyLike()
        if isLiked != self.isLiked {
            self.isLiked = isLiked
        }
    }
    
    func updateLikeState() {
        isLiked.toggle()
        if isLiked {
            guard let drink = drink else { return }
            databaseService.writeCocktail(shortCocktail: .init(name: drink.drinkName, imageUrl: drink.drinkImageUrl, drinkId: drinkId)) {
                print("Write success")
            }
        } else {
            databaseService.removeCocktail(by: drinkId) { result in
                switch result {
                case .success:
                    print("Removed")
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getCoctailsDetail() async {
        do {
            let details = try await networkServise.getCoctailDetails(for: drinkId)
            await updateDrink(drink: details.drinks[0])
        } catch {
            print(error.localizedDescription)
        }
    }
}
