//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 31.08.2025.
//

import SwiftUI

struct BackgroundImage: View {
    let image : ImageResource
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .blur(radius: 6)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage(image: .onboardingOne)
}
