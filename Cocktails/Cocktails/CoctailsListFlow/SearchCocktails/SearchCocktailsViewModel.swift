//
//  SearchCocktailsViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.12.22.
//

import SwiftUI

final class SearchCocktailsViewModel: ObservableObject {
    // MARK: - Private properties
    
    private let networkServise: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    @Published var drinks = [Drink]()
    
    // MARK: - Init
    
    init(
        networkServise: NetworkServiceProtocol = NetworkService.shared,
        databaseService: DatabaseServiceProtocol = DatabaseService.shared
    ) {
        self.networkServise = networkServise
        self.databaseService = databaseService
    }
    
    // MARK: - Private methods
    
    @MainActor
    private func updateDrinks(drinks: [Drink]) {
        self.drinks = drinks
    }
    
    // MARK: - Public methods
    
    func getCocktails(with name: String) async {
        do {
            let value = try await networkServise.getSearchedCocktails(for: name)
            await updateDrinks(drinks: value.drinks)
        } catch {
            print(error.localizedDescription)
        }
    }
}
