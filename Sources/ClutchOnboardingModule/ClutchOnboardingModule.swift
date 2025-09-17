// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI
import ClutchModularProtocols

//MARK: - ClutchOnboardingMoule:
@MainActor
public class ClutchOnboardingModule : @preconcurrency OnboardingModuleProtocol {
    
    public init() { }
    
    public func createOnboardingModuleView() -> AnyView {
        let view = OnboardingView(viewModel: OnboardingViewModel())
        return AnyView(view)
    }
}
