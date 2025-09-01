//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 31.08.2025.
//

import SwiftUI

struct SubImage: View {
    let image : ImageResource
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                        .stroke(Color.white, lineWidth: 5)
                        .shadow(radius: 5)
                )
            
        }
        .padding(15)
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 70)
                .stroke(Color.white, lineWidth: 1)
        )
    }
}

#Preview {
    SubImage(image: .onboardingOne)
}
