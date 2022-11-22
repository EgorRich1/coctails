//
//  CocktailsDetailsViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 22.11.22.
//

import SwiftUI

class CocktailsDetailsViewModeling: ObservableObject {
    func updateLikeState(isLiked: Bool) {}
    func getCoctailsDetail() async {}
}

final class CocktailsDetailsViewModel: CocktailsDetailsViewModeling {
    // MARK: - Private properties
    
    private let networkServise: NetworkServiceProtocol
    private let drinkId: String
    
    // MARK: - Init
    
    init(
        drinkId: String,
        networkServise: NetworkServiceProtocol = NetworkService.shared
    ) {
        self.drinkId = drinkId
        self.networkServise = networkServise
    }
    
    override func updateLikeState(isLiked: Bool) {
        print(isLiked)
    }
    
    override func getCoctailsDetail() async {
        
    }
}
