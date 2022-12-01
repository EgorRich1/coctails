//
//  CoctailCardView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 31.10.22.
//

import SwiftUI

struct CoctailCardView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: CoctailCardViewModel
    
    private let title: String
    private let imageUrl: String
    private let drinkId: String
    private let cocktail: ShortDrinkModel
    
    init(cocktail: ShortDrinkModel) {
        self.title = cocktail.drink
        self.imageUrl = cocktail.imageUrl
        self.drinkId = cocktail.drinkId
        self.cocktail = cocktail
        let viewModel = CoctailCardViewModel(cocktail: cocktail)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl),
                       content: { $0.resizable() },
                       placeholder: { Text("Loading...") }
            )
                .frame(width: 300, height: 180)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            HStack(alignment: .top) {
                Text(title)
                    .font(.headline)
                Spacer()
                Image($viewModel.isLiked.wrappedValue ? "like" : "unlike").onTapGesture {
                    viewModel.updateLikeState()
                }
            }
            .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
            .padding(.vertical, 16)
        }
        .background(Color(hex: "D9D9D9"))
        .onAppear {
            viewModel.setupState()
        }
    }
}

struct CoctailCardView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailCardView(cocktail: .init(name: "", imageUrl: "", drinkId: ""))
    }
}
