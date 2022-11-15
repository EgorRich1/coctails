//
//  SectionView.swift
//  Cocktails
//
//  Created by Егор Ярошук on 14.11.22.
//

import SwiftUI

struct SectionView: View {
    
    @Binding var isAlcoholic: Bool
        
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Alcohol").font(.title2)
                    Rectangle()
                        .frame(height: isAlcoholic ? 2 : 1, alignment: .center)
                        .animation(.default.speed(3), value: 1)
                        .background(Color.black)
                }.onTapGesture {
                    isAlcoholic = true
                }
                Spacer()
                VStack {
                    Text("Non Alcohol").font(.title2)
                    Rectangle()
                        .frame(height: isAlcoholic ? 1 : 2, alignment: .center)
                        .animation(.default.speed(3), value: 1)
                        .background(Color.black)
                }.onTapGesture {
                    isAlcoholic = false
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(isAlcoholic: .constant(false))
    }
}
