//
//  CocktailsListView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

struct CocktailsListView: View {
    // MARK: - Properties
    
    @State var isAlcoholic = true 
    @StateObject var viewModel: CocktailsViewModeling
        
    init(viewModel: CocktailsViewModeling = CocktailsListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    SectionView(isAlcoholic: $isAlcoholic).padding(.horizontal, 16)
                    LazyVStack {
                        ForEach(isAlcoholic ? viewModel.alcoholCocktailsList?.drinks ?? [] : viewModel.nonAlcoholCocktailsList?.drinks ?? []) { drink in
                            NavigationLink(
                                destination: CocktailsDetailsView(drinkId: drink.drinkId).navigationBarTitle("Cocktails details")
                            ) {
                                CoctailCardView(cocktail: drink)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Cocktails")
        }.task {
            await viewModel.getCoctails(isAlcoholic: true)
            await viewModel.getCoctails(isAlcoholic: false)
        }
    }
}

struct CocktailsListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView()
    }
}
