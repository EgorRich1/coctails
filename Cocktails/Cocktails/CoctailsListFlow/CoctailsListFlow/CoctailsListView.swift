//
//  CoctailsListView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

struct CoctailsListView: View {
    // MARK: - Properties
    
    @StateObject var viewModel: CoctailsViewModeling
    
    private let gridItemVLayout = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 1)
    
    init(viewModel: CoctailsViewModeling = CoctailsListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemVLayout) {
                    ForEach(viewModel.coctailsList?.drinks ?? []) { drink in
                        CoctailCardView(title: drink.drink, imageUrl: drink.imageUrl, drinkId: drink.drinkId)
                    }
                }
            }
        }.task {
            await viewModel.getCoctails()
        }
    }
}

struct CoctailsListView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailsListView()
    }
}
