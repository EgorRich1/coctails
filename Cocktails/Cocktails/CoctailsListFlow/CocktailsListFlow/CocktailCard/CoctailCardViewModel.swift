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
    
    private let drinkName: String
    private let drinkId: String
    
    init(drinkName: String, drinkId: String) {
        self.drinkName = drinkName
        self.drinkId = drinkId
    }
    
    override func updateLikeState(isLiked: Bool) {
        print(isLiked)
    }
}
