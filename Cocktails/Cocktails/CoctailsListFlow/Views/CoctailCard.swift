//
//  CoctailCard.swift
//  Cocktails
//
//  Created by Егор Ярошук on 31.10.22.
//

import SwiftUI

struct CoctailCard: View {
    var body: some View {
        VStack {
            Image("image_placeholder")
                .resizable()
                .frame(width: 300, height: 180)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            HStack(alignment: .top) {
                Text("Name of the cocktail")
                    .font(.headline)
                Spacer()
                Image("unlike")
            }
            .padding(.horizontal, (UIScreen.main.bounds.width - 300) / 2)
            .padding(.vertical, 16)
        }.background(Color(hex: "D9D9D9"))
    }
}

struct CoctailCard_Previews: PreviewProvider {
    static var previews: some View {
        CoctailCard()
    }
}
