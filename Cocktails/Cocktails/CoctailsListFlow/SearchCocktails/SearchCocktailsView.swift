//
//  SearchCocktailsView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.12.22.
//

import SwiftUI

struct SearchCocktailsView: View {
    // MARK: - Properties
    
    @State private var text: String = ""
    @StateObject var viewModel: SearchCocktailsViewModel
        
    init(viewModel: SearchCocktailsViewModel = SearchCocktailsViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("Type name", text: $viewModel.searchText)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .border(.black)
                    .padding(.horizontal, 10)
                    .font(.title)
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
        }
    }
}

struct SearchCocktailsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCocktailsView()
    }
}
