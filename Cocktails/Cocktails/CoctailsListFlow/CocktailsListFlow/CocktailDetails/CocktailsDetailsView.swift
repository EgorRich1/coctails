//
//  CocktailsDetailsView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 18.11.22.
//

import SwiftUI

struct CocktailsDetailsView: View {
    
    // MARK: - Properties
        
    @StateObject var viewModel: CocktailsDetailsViewModel
        
    init(drinkId: String) {
        _viewModel = StateObject(wrappedValue: CocktailsDetailsViewModel(drinkId: drinkId))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: viewModel.drink?.drinkImageUrl ?? ""),
                               content: { $0.resizable() },
                               placeholder: { Text("Loading...") }
                    )
                    .frame(width: 300, height: 180)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                    Spacer()
                }
                HStack(alignment: .top) {
                    Text(viewModel.drink?.drinkName ?? "")
                        .font(.headline)
                    Spacer()
                    Image($viewModel.isLiked.wrappedValue ? "like" : "unlike").onTapGesture {
                        viewModel.updateLikeState()
                    }
                }
                .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
                .padding(.vertical, 16)
                Group {
                    HStack(alignment: .top) {
                        Text("Ingridients: ").font(.bold(.title3)())
                        Text(viewModel.drink?.ingredients.joined(separator: ", ") ?? "")
                    }.padding(.leading, (UIScreen.main.bounds.width - 300) / 2)
                    Spacer()
                    HStack() {
                        Text("Alcoholic: ").font(.bold(.title3)())
                        Text(viewModel.drink?.alcoholic ?? "")
                    }.padding(.leading, (UIScreen.main.bounds.width - 300) / 2)
                    Spacer()
                    HStack {
                        Text("Glass: ").font(.bold(.title3)())
                        Text(viewModel.drink?.glass ?? "")
                    }.padding(.leading, (UIScreen.main.bounds.width - 300) / 2)
                    Spacer()
                    HStack(alignment: .top) {
                        Text("Instructions: ").font(.bold(.title3)())
                        Text(viewModel.drink?.instructions ?? "")
                    }.padding(.leading, (UIScreen.main.bounds.width - 300) / 2)
                    Spacer()
                    HStack(alignment: .top) {
                        Text("Measures: ").font(.bold(.title3)())
                        Text(viewModel.drink?.measures.joined(separator: ", ") ?? "")
                    }.padding(.leading, (UIScreen.main.bounds.width - 300) / 2)
                }
            }
            .background(Color(hex: "D9D9D9"))
            .task {
                await viewModel.getCoctailsDetail()
            }
            .onAppear {
                viewModel.setupState()
            }
        }
    }
}

struct CocktailsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsDetailsView(drinkId: "")
    }
}
