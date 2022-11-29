//
//  CocktailsListViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

class CocktailsViewModeling: ObservableObject {
    
    @Published var alcoholCocktailsList: CocktailsList?
    @Published var nonAlcoholCocktailsList: CocktailsList?
    
    func getCoctails(isAlcoholic: Bool) async {}
}

final class CocktailsListViewModel: CocktailsViewModeling {
    // MARK: - Private properties
    
    private let networkServise: NetworkServiceProtocol
    
    // MARK: - Init
    
    init(networkServise: NetworkServiceProtocol = NetworkService.shared) {
        self.networkServise = networkServise
    }
    
    override func getCoctails(isAlcoholic: Bool) async {
        do {
            if isAlcoholic {
                let coctails = try await networkServise.getCocktails(isAlcohol: isAlcoholic)
                await updateAlcoholCoctails(cocktails: coctails)
            } else {
                let coctails = try await networkServise.getCocktails(isAlcohol: isAlcoholic)
                await updateNonAlcoholCocktails(cocktails: coctails)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func updateAlcoholCoctails(cocktails: CocktailsList) {
        self.alcoholCocktailsList = cocktails
    }
    
    @MainActor
    private func updateNonAlcoholCocktails(cocktails: CocktailsList) {
        self.nonAlcoholCocktailsList = cocktails
    }
}
