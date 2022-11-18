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
    
    private let gridItemVLayout = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 1)
    
    init(viewModel: CocktailsViewModeling = CocktailsListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    SectionView(isAlcoholic: $isAlcoholic).padding(.horizontal, 16)
                    LazyVGrid(columns: gridItemVLayout) {
                        ForEach(isAlcoholic ? viewModel.alcoholCocktailsList?.drinks ?? [] : viewModel.nonAlcoholCocktailsList?.drinks ?? []) { drink in
                            CoctailCardView(title: drink.drink, imageUrl: drink.imageUrl, drinkId: drink.drinkId)
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
