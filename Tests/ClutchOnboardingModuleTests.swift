//
//  Test.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 31.08.2025.
//

import Testing
import ClutchCoreKit
@testable import ClutchOnboardingModule

@Suite
class OnboardingViewModelTests {
    var viewModel: (any OnboardingViewModelProtocol)!

    init() {
        self.viewModel = OnboardingViewModel()
    }

    @Test("When the page is first opened, the current page should be 0.")
    func testCurrentPageIsZeroOnStart() {
        let expectedPage = 0
        let currentPage = viewModel.currentPage

        #expect(expectedPage == currentPage)
    }

    @Test("When the page is first opened, the rightText should be LocalizableTheme.next.localized")
    func testRightButtonTextIsNextOnStart() {
        let expectedText = LocalizableTheme.next.localized
        let rightButtonText = viewModel.rightText

        #expect(expectedText == rightButtonText)
    }

    @Test("When the page is first opened, the leftText should be LocalizableTheme.skip.localized")
    func testLeftButtonTextIsSkipOnStart() {
        let expectedText = LocalizableTheme.skip.localized
        let leftButtonText = viewModel.leftText

        #expect(expectedText == leftButtonText)
    }

    @Test("First opened onboarding page should have correct content")
    func testFirstOnboardingPageContent() async throws {
        let expectedPage = OnboardingPage(
            image: .init(image: .onboardingOne, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingOneTitle.localized,
            subTitle: LocalizableTheme.onboardingOneDesc.localized
        )

        let currentPage = viewModel.getOnboardingPage()

        #expect(expectedPage.image.image == currentPage.image.image)
        #expect(expectedPage.title == currentPage.title)
        #expect(expectedPage.subTitle == currentPage.subTitle)
    }

    @Test("Next onboarding page appears after tapping right button once")
    func testSecondOnboardingPageAfterRightButtonTap() async throws {
        let expectedPage = OnboardingPage(
            image: .init(image: .onboardingTwo, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingTwoTitle.localized,
            subTitle: LocalizableTheme.onboardingTwoDesc.localized
        )

        viewModel.onTappedRightButton()
        let currentPage = viewModel.getOnboardingPage()

        #expect(expectedPage.image.image == currentPage.image.image)
        #expect(expectedPage.title == currentPage.title)
        #expect(expectedPage.subTitle == currentPage.subTitle)
    }

    @Test("Third onboarding page appears after tapping right button twice")
    func testThirdOnboardingPageAfterTwoRightButtonTaps() async throws {
        let expectedPage = OnboardingPage(
            image: .init(image: .onboardingThree, desc: "onboardingOne's image"),
            title: LocalizableTheme.onboardingThreeTitle.localized,
            subTitle: LocalizableTheme.onboardingThreeDesc.localized
        )

        viewModel.onTappedRightButton()
        viewModel.onTappedRightButton()
        let currentPage = viewModel.getOnboardingPage()

        #expect(expectedPage.image.image == currentPage.image.image)
        #expect(expectedPage.title == currentPage.title)
        #expect(expectedPage.subTitle == currentPage.subTitle)
    }

    @Test("Right button text should be 'Login' after onboarding ends")
    func testRightButtonTextAfterOnboardingEnds() {
        let expectedText = LocalizableTheme.login.localized

        viewModel.onTappedRightButton()
        viewModel.onTappedRightButton()
        let rightButtonText = viewModel.rightText

        #expect(expectedText == rightButtonText)
    }

    deinit {
        self.viewModel = nil
    }
}
