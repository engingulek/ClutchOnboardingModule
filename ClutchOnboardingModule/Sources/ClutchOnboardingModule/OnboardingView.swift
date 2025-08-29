//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI

import SwiftUI

struct OnboardingPage {
    let image: String
    let title: String
}

struct OnboardingView: View {
    // Sayfa verileri
    let pages: [OnboardingPage] = [
        OnboardingPage(image: "star", title: "Uygulamamıza Hoşgeldin!"),
        OnboardingPage(image: "heart", title: "Favori içeriklerini kaydet."),
        OnboardingPage(image: "bolt", title: "Hızlı ve kolay kullanım.")
    ]
    
    // Aktif sayfa
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            
            Image(systemName: pages[currentPage].image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            
            Text(pages[currentPage].title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            HStack {
                
                currentPage != 0 ?
                Button(action: {
                    if currentPage != 0 {
                        currentPage -= 1
                    } else {
                        print("Onboarding tamamlandı")
                    }
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .padding(.trailing, 20)
                } : nil
                
                
                
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.blue : Color.gray.opacity(0.4))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.leading, 20)
                
                Spacer()
                
                
                
                currentPage == pages.count - 1 ? AnyView(
                    
                    Button(action: {
                        print("Onboarding tamamlandı")
                    }) {
                        Text("Go To Sing PAge")
                    }
                ) : AnyView(Button(action: {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .padding(.trailing, 20)
                })
                
                
                
                
            }
            .padding(.bottom, 30)
        }
        .animation(.easeInOut, value: currentPage)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
