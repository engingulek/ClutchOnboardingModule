//
//  OnboardingViewModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import Foundation

protocol OnboardingViewModelProtocol: ObservableObject {
    var currentPage: Int { get }
    var pages: [OnboardingPage] { get }
    var rightText: String { get }
    
    
    func currentPageIncrement()
    
    func getOnboardingPage() -> OnboardingPage
    func onTappedSkip()
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    @Published private(set) var currentPage: Int = 0
    @Published private(set) var rightText: String = "Next"
    
    
    let pages: [OnboardingPage] = [
        OnboardingPage(image: "onboardingOne", title: "Uygulamamıza Hoşgeldin!"),
        OnboardingPage(image: "onboardingOne", title: "Favori içeriklerini kaydet."),
        OnboardingPage(image: "onboardingOne", title: "Hızlı ve kolay kullanım.")
    ]
    
    func currentPageIncrement() {
       
        if currentPage < pages.count - 1 {
            currentPage += 1
            rightText = (currentPage == pages.count - 1) ? "Login" : "Next"
        }
    }
    
   
    
    func getOnboardingPage() -> OnboardingPage {
        return pages[currentPage]
    }
    
    func onTappedSkip() {
        print("On Tappped Skip")
    }
   
}

