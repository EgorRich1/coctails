//
//  CoctailsListViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

class CoctailsViewModeling: ObservableObject {
    
    @Published var alcoholCocktailsList: CoctailsList?
    @Published var nonAlcoholCocktailsList: CoctailsList?
    
    func getCoctails(isAlcoholic: Bool) async {}
}

final class CoctailsListViewModel: CoctailsViewModeling {
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
                await updateAlcoholCoctails(coctails: coctails)
            } else {
                let coctails = try await networkServise.getCocktails(isAlcohol: isAlcoholic)
                await updateNonAlcoholCocktails(coctails: coctails)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func updateAlcoholCoctails(coctails: CoctailsList) {
        self.alcoholCocktailsList = coctails
    }
    
    @MainActor
    private func updateNonAlcoholCocktails(coctails: CoctailsList) {
        self.nonAlcoholCocktailsList = coctails
    }
}
