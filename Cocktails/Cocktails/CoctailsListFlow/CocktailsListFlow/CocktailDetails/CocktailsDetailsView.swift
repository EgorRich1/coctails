//
//  CocktailsDetailsView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 18.11.22.
//

import SwiftUI

struct CocktailsDetailsView: View {
    
    // MARK: - Properties
    
    @State var likeImage = "unlike"
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "imageUrl"),
                       content: { $0.resizable() },
                       placeholder: { Text("Loading...") }
            )
                .frame(width: 300, height: 180)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            HStack(alignment: .top) {
                Text("title")
                    .font(.headline)
                Spacer()
                Image(self.likeImage).onTapGesture {
                    self.likeImage = self.likeImage == "unlike" ? "like" : "unlike"
//                    viewModel.updateLikeState(isLiked: self.likeImage == "unlike")
                }
            }
            .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
            .padding(.vertical, 16)
        }.background(Color(hex: "D9D9D9"))
    }
}

struct CocktailsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsDetailsView()
    }
}
