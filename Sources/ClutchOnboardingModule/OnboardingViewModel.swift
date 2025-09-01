//
//  OnboardingViewModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import Foundation
import ClutchCoreKit

// MARK: - OnboardingViewModelProtocol
/// Protocol defining the behavior of an onboarding view model.
protocol OnboardingViewModelProtocol: ObservableObject {
    
    /// Current page index in the onboarding flow.
    var currentPage: Int { get }
    
    /// Text shown on the right button.
    var rightText: String { get }
    
    /// Text shown on the left button.
    var leftText: String { get }
    
    /// Moves to the next page or updates right button text if last page.
    func onTappedRightButton()
    
    /// Returns the current onboarding page.
    func getOnboardingPage() -> OnboardingPage
    
    /// Returns total number of onboarding pages.
    func getOnboardingPageCount() -> Int
    
    /// Skip Button Action
    func onTappedSkip()
}

// MARK: - OnboardingViewModel
/// ViewModel managing the state and actions of the onboarding flow.
class OnboardingViewModel: OnboardingViewModelProtocol {
    
    @Published var currentPage: Int = 0
    @Published var rightText: String = LocalizableTheme.next.localized
    var leftText: String = LocalizableTheme.skip.localized
    
    /// Predefined onboarding pages.
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            image: .init(image: .onboardingOne, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingOneTitle.localized,
            subTitle: LocalizableTheme.onboardingOneDesc.localized
        ),
        OnboardingPage(
            image: .init(image: .onboardingTwo, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingTwoTitle.localized,
            subTitle: LocalizableTheme.onboardingTwoDesc.localized
        ),
        OnboardingPage(
            image: .init(image: .onboardingThree, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingThreeTitle.localized,
            subTitle: LocalizableTheme.onboardingThreeDesc.localized
        )
    ]
    
    
    func onTappedRightButton() {
        if currentPage < pages.count - 1 {
            currentPage += 1
            rightText = (currentPage == pages.count - 1)
                ? LocalizableTheme.login.localized
                : LocalizableTheme.next.localized
        }
    }
    
    
    func getOnboardingPage() -> OnboardingPage {
        return pages[currentPage]
    }
    

    func onTappedSkip() {
        print("On Tapped Skip")
    }
    
   
    func getOnboardingPageCount() -> Int {
        return pages.count
    }
}

