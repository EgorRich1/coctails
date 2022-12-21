//
//  SearchCocktailsViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.12.22.
//

import SwiftUI

final class SearchCocktailsViewModel: ObservableObject {
    // MARK: - Private properties
    
    private var timer: Timer?
    private let networkServise: NetworkServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    @Published var drinks = [Drink]()
    @Published var searchText = "" {
        willSet(newValue) {
            checkRequest()
        }
    }
    
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
    
    // MARK: - Private methods
    
    private func checkRequest() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(handleEndOfTimer), userInfo: nil, repeats: false)
    }
    
    @objc private func handleEndOfTimer() {
        Task {
            await self.getCocktails()
        }
    }
    
    private func getCocktails() async {
        do {
            if searchText.isEmpty {
                await updateDrinks(drinks: [])
                return
            }
            let value = try await networkServise.getSearchedCocktails(for: searchText)
            await updateDrinks(drinks: value.drinks)
        } catch {
            print(error.localizedDescription)
        }
    }
}
