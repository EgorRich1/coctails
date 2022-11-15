//
//  SectionView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.11.22.
//

import SwiftUI

struct SectionView: View {
    
    @State var isActive: Bool = false
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title).font(.title2)
            Rectangle()
                .frame(height: isActive ? 2 : 1, alignment: .center)
                .animation(.default.speed(3), value: 1)
                .background(Color.black)
            Button("Button") {
                isActive.toggle()
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "title")
    }
}
