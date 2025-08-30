//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI
import ClutchCoreKit
struct OnboardingView<VM:OnboardingViewModelProtocol>: View {
    @StateObject var viewModel : VM
   
 
  
    @State private var currentPage = 0
    
    var body: some View {
        
        ZStack {
            
            Image(viewModel.getOnboardingPage().image.image)
                .resizable()
                .scaledToFill()
                .blur(radius: 6)
                .ignoresSafeArea()
            
           
            VStack(alignment:.center,spacing: 20) {
                Image(viewModel.getOnboardingPage().image.image)
                           .resizable()
                           .scaledToFill()
                           .frame(width: 250, height: 350)
                           .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous))
                           .overlay(
                               RoundedRectangle(cornerRadius: 60, style: .continuous)
                                   .stroke(Color.white, lineWidth: 5)
                                   .shadow(radius: 5)
                           ).padding(.top,10)
                
                Text(viewModel.getOnboardingPage().title)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                  
                
                
                Text(viewModel.getOnboardingPage().subTitle)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .foregroundStyle(.white)
                  
                    .lineLimit(.max)
                    .padding(.horizontal,60)
                  
                  
                
                Spacer()
                
                HStack {
                    
                    
                    Button(action: {
                         viewModel.onTappedSkip()
                     }) {
                         
                         Text(viewModel.leftText)
                             .font(.title2)
                             .foregroundStyle(.white)
                             .multilineTextAlignment(.center)
                             .fontWeight(.light)
                            
                     }
                    
                  
                    HStack(spacing: 8) {
                        ForEach(0..<viewModel.getOnboardingPageCount(), id: \.self) { index in
                            Circle()
                                .fill(index == viewModel.currentPage ? Color.white : Color.gray.opacity(0.4))
                                .frame(width: 10, height: 10)
                        }
                    }.padding(.horizontal,90)
                    
                   Button(action: {
                        viewModel.currentPageIncrement()
                    }) {
                        
                        Text(viewModel.rightText)
                               .font(.title2)
                               .foregroundStyle(.white)
                               .multilineTextAlignment(.center)
                               .fontWeight(.bold)
                           
                    }
                 
                }
               
            }
        } .animation(.easeInOut, value: viewModel.currentPage)
        
   
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
