//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI

import SwiftUI


struct OnboardingView<VM:OnboardingViewModelProtocol>: View {
    @StateObject var viewModel : VM
   
 
  
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            
            Image(systemName: viewModel.getImageName())
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            
            Text(viewModel.pages[currentPage].title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            HStack {
                
                viewModel.leftArrowButtonHidden ?
                Button(action: {
                    viewModel.currentPageDecrement()
                    
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                        .padding(.trailing, 20)
                } : nil
                
                
                
                HStack(spacing: 8) {
                    ForEach(0..<viewModel.pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == viewModel.currentPage ? Color.blue : Color.gray.opacity(0.4))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.leading, 20)
                
                Spacer()
                
                
                
                viewModel.goToSingPage ? AnyView(
                    
                    Button(action: {
                       
                    }) {
                        Text("Go To Sing PAge")
                    }
                ) : AnyView(Button(action: {
                    viewModel.currentPageIncrement()
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
        .animation(.easeInOut, value: viewModel.currentPage)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
