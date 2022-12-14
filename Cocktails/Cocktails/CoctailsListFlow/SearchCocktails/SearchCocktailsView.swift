//
//  SearchCocktailsView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.12.22.
//

import SwiftUI

struct SearchCocktailsView: View {
    // MARK: - Properties
    
    @StateObject var viewModel: SearchCocktailsViewModel
        
    init(viewModel: SearchCocktailsViewModel = SearchCocktailsViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.drinks) { drink in
                        NavigationLink(
                            destination: CocktailsDetailsView(drinkId: drink.drinkId).navigationBarTitle("Cocktails details")
                        ) {
                            CoctailCardView(cocktail: ShortDrinkModel(name: drink.drinkName, imageUrl: drink.drinkImageUrl, drinkId: drink.drinkId))
                        }.buttonStyle(PlainButtonStyle())
    
                    }
                }
            }.navigationTitle("Search")
        }.task {
            await viewModel.getCocktails(with: "Mar")
        }
    }
}

struct SearchCocktailsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCocktailsView()
    }
}
