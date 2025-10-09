//
//  SwiftUIView.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import SwiftUI
import ClutchCoreKit
import ClutchNavigationKit

//MARK: -OnboardingView
struct OnboardingView<VM:OnboardingViewModelProtocol>: View {
    
    @StateObject var viewModel : VM
    @EnvironmentObject private var navigation:Navigation
    
    init(viewModel: @autoclosure @escaping () -> VM) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        ZStack {
            // background image
            BackgroundImage(image: viewModel.getOnboardingPage().image.image)
            
            VStack(alignment:.center,spacing: 20) {
                // sub image
                SubImage(image: viewModel.getOnboardingPage().image.image )
                
                // title text
                TextType(text: viewModel.getOnboardingPage().title,
                         color: .white, fontType: .titleSB)
                
                // subtitle text
                TextType(
                    text: viewModel.getOnboardingPage().subTitle,
                    color: .white,fontType: .titleTwoNormal)
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    // left text button
                    TextButton(
                        text: viewModel.leftText,
                        color: .white, fontType: FontType.titleTwoLight) {
                            
                            viewModel.onTappedSkipButton()
                        }
                    
                    // indicator
                    HStack(spacing: 8) {
                        ForEach(0..<viewModel.getOnboardingPageCount(),
                                id: \.self) { index in
                            Circle()
                                .fill(index == viewModel.currentPage
                                      ? Color.white
                                      : Color.gray.opacity(0.4))
                                .frame(width: 10, height: 10)
                        }
                    }.padding(.horizontal,90)
                    
                    // left text button
                    TextButton(text: viewModel.rightText,
                               color: .white,
                               fontType: .titleTwoBold) {
                        viewModel.onTappedRightButton()
                    }
                }
            }
        } .animation(.easeInOut, value: viewModel.currentPage)
            .onAppear {
                // Navigation shutdown setting is being made
                viewModel.onFinish = {
                    navigation.pop()
                    navigation.push(.account)
                 
                }
            }
    }
    
}


#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
