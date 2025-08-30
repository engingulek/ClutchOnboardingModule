//
//  OnboardingModel.swift
//  ClutchOnboardingModule
//
//  Created by Engin Gülek on 29.08.2025.
//

import DeveloperToolsSupport

struct OnboardingPage {
    let image: ImageResourceModel
    let title: String
    let subTitle:String
}


struct ImageResourceModel {
    let image : ImageResource
    let desc : String
}


struct OnboardingText {
    let skip:String
    let next:String
    let login:String
}

