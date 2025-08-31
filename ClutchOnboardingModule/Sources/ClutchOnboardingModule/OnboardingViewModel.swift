//
//  OnboardingViewModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import Foundation
import ClutchCoreKit
protocol OnboardingViewModelProtocol: ObservableObject {
    var currentPage: Int { get }
    var rightText: String { get }
    var leftText : String {get}
   
    
    func onTappedRightButton()
    func getOnboardingPage() -> OnboardingPage
    func getOnboardingPageCount() -> Int
    func onTappedSkip()
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    @Published  var currentPage: Int = 0
    @Published var rightText: String = LocalizableTheme.next.localized
    var leftText: String = LocalizableTheme.skip.localized
   
    
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            image: .init(
                image: .onboardingOne,
                desc: "onboardingOne's image"),
            title:LocalizableTheme.onboardingOneTitle.localized,
            subTitle: LocalizableTheme.onboardingOneDesc.localized),
        OnboardingPage(
            image: .init(image: .onboardingTwo, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingTwoTitle.localized,
            subTitle: LocalizableTheme.onboardingTwoDesc.localized),
        OnboardingPage(
            image: .init(image: .onboardingThree, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingThreeTitle.localized,
            subTitle: LocalizableTheme.onboardingThreeDesc.localized)
        
    ]
    
    func onTappedRightButton() {
       
        if currentPage < pages.count - 1 {
            currentPage += 1
            rightText = (currentPage == pages.count - 1) ? LocalizableTheme.login.localized : LocalizableTheme.next.localized
        }
    }
    
   
    
    func getOnboardingPage() -> OnboardingPage {
        return pages[currentPage]
    }
    
    func onTappedSkip() {
        print("On Tappped Skip")
    }
    
    
    func getOnboardingPageCount() -> Int {
        return pages.count
    }
   
}

