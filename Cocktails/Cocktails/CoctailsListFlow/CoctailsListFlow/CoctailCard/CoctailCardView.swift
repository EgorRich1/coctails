//
//  CoctailCardView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 31.10.22.
//

import SwiftUI

struct CoctailCardView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: CoctailCardViewModeling
    @State var likeImage = "unlike"
    
    private let title: String
    private let imageUrl: String
    private let drinkId: String
    
    init(title: String, imageUrl: String, drinkId: String) {
        self.title = title
        self.imageUrl = imageUrl
        self.drinkId = drinkId
        let viewModel = CoctailCardViewModel(drinkName: title, drinkId: drinkId)
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
                Image(self.likeImage).onTapGesture {
                    self.likeImage = self.likeImage == "unlike" ? "like" : "unlike"
                    viewModel.updateLikeState(isLiked: self.likeImage == "unlike")
                }
            }
            .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
            .padding(.vertical, 16)
        }.background(Color(hex: "D9D9D9"))
    }
}

struct CoctailCardView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailCardView(title: "Long island", imageUrl: "", drinkId: "")
    }
}
