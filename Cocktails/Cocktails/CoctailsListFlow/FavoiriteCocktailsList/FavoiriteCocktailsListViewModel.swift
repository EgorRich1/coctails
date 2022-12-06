//
//  FavoiriteCocktailsListViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 6.12.22.
//

import SwiftUI

final class FavoiriteCocktailsListViewModel: ObservableObject {
    
    // MARK: Private properties
    
    private let databaseService: DatabaseServiceProtocol
    @Published var favoriteCocktails: [ShortDrinkModel]? = nil
    
    // MARK: - Init
    
    init(databaseService: DatabaseServiceProtocol = DatabaseService.shared) {
        self.databaseService = databaseService
    }
    
    // MARK: - Public methods
    
    func getFavoriteCocnktails() {
        favoriteCocktails = databaseService.getListOfFavoriteCocktails()
    }
}
