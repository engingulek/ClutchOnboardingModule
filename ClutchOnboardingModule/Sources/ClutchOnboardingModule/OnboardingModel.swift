//
//  OnboardingModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import DeveloperToolsSupport

// MARK: - OnboardingPage
/// Represents a single page in the onboarding flow.
/// - image: The visual content of the page along with its description.
/// - title: The main title displayed on the onboarding page.
/// - subTitle: A subtitle or brief description shown below the main title.
struct OnboardingPage {
    let image: ImageResourceModel
    let title: String
    let subTitle: String
}

// MARK: - ImageResourceModel
/// Represents an image resource together with a descriptive text.
/// - image: The actual image to be displayed on the screen.
/// - desc: A textual description of the image, useful for accessibility or testing purposes.
struct ImageResourceModel {
    let image: ImageResource
    let desc: String
}


