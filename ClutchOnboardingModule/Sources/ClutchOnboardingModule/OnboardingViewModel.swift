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
    var goToSingPage: Bool { get }
    var leftArrowButtonHidden: Bool { get }
    
    func currentPageIncrement()
    func currentPageDecrement()
    func getImageName() -> String
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    @Published private(set) var currentPage: Int = 0
    @Published private(set) var goToSingPage: Bool = false
    @Published private(set) var leftArrowButtonHidden: Bool = false
    
    let pages: [OnboardingPage] = [
        OnboardingPage(image: "star", title: "Uygulamamıza Hoşgeldin!"),
        OnboardingPage(image: "heart", title: "Favori içeriklerini kaydet."),
        OnboardingPage(image: "bolt", title: "Hızlı ve kolay kullanım.")
    ]
    
    func currentPageIncrement() {
       
        if currentPage < pages.count - 1 {
            currentPage += 1
            updateState()
        }
    }
    
    func currentPageDecrement() {
        if currentPage > 0 {
            currentPage -= 1
            updateState()
        }
    }
    
    func getImageName() -> String {
        return pages[currentPage].image
    }
    
     func updateState() {
        leftArrowButtonHidden = (currentPage > 0)
        goToSingPage = (currentPage == pages.count - 1)
    }
}

