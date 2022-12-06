//
//  FavoiriteCocktailsListView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 6.12.22.
//

import SwiftUI

struct FavoiriteCocktailsListView: View {
    
    @StateObject var viewModel: FavoiriteCocktailsListViewModel
    
    private let gridItemVLayout = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 1)
    
    init(viewModel: FavoiriteCocktailsListViewModel = FavoiriteCocktailsListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if (viewModel.favoriteCocktails ?? []).isEmpty {
                    Text("You have no favorite cocktails").padding()
                }
                ScrollView {
                    LazyVGrid(columns: gridItemVLayout) {
                        ForEach(viewModel.favoriteCocktails ?? []) { drink in
                            NavigationLink(
                                destination: CocktailsDetailsView(drinkId: drink.drinkId).navigationBarTitle("Cocktails details")
                            ) {
                                CoctailCardView(cocktail: drink)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Favorite cocktails")
        }.onAppear {
            viewModel.getFavoriteCocnktails()
        }
    }
}

struct FavoiriteCocktailsListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoiriteCocktailsListView()
    }
}
