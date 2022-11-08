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
    
    init(viewModel: CoctailsViewModeling = CoctailsListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            CoctailCard()
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
