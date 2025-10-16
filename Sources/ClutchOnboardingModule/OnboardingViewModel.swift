//
//  OnboardingViewModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import Foundation
import ClutchCoreKit
import ClutchManagerKits


// MARK: - OnboardingViewModelProtocol
/// Protocol defining the behavior of an onboarding view model.
protocol OnboardingViewModelProtocol: ObservableObject {
    
    /// Current page index in the onboarding flow.
    var currentPage: Int { get }
    
    /// Text shown on the right button.
    var rightText: String { get }
    
    /// Text shown on the left button.
    var leftText: String { get }
    /// // To trigger navigation
    var onFinish: (() -> Void)? { get set }
    
    /// Moves to the next page or updates right button text if last page.
    func onTappedRightButton()
    
    /// Returns the current onboarding page.
    func getOnboardingPage() -> OnboardingPage
    
    /// Returns total number of onboarding pages.
    func getOnboardingPageCount() -> Int
    
    func onTappedSkipButton()
    
  
    
}

// MARK: - OnboardingViewModel
/// ViewModel managing the state and actions of the onboarding flow.
class OnboardingViewModel: OnboardingViewModelProtocol {
    
    @Published var currentPage: Int = 0
    @Published var rightText: String = LocalizableTheme.next.localized
    var leftText: String = LocalizableTheme.skip.localized
    var onFinish: (() -> Void)?
    private let pageManager : FirstPageManagerProtocol = FirstPageManager()
    /// Predefined onboarding pages.
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            image: .init(image: .onboardingOne, desc: "onboardingFirst's image"),
            title: LocalizableTheme.onboardingOneTitle.localized,
            subTitle: LocalizableTheme.onboardingOneDesc.localized
        ),
        OnboardingPage(
            image: .init(image: .onboardingTwo, desc: "onboardingSecond's image"),
            title: LocalizableTheme.onboardingTwoTitle.localized,
            subTitle: LocalizableTheme.onboardingTwoDesc.localized
        ),
        OnboardingPage(
            image: .init(image: .onboardingThree, desc: "onboardingThird's image"),
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
        }else{
            onFinish?()
            pageManager.handle(.markAppAsLaunched)
        }
    }
    
    func onTappedSkipButton() {
        onFinish?()
        pageManager.handle(.markAppAsLaunched)
    }
    
    
    func getOnboardingPage() -> OnboardingPage {
        return pages[currentPage]
    }
   
    func getOnboardingPageCount() -> Int {
        return pages.count
    }
}

