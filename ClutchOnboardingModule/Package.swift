// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClutchOnboardingModule",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClutchOnboardingModule",
            targets: ["ClutchOnboardingModule"]),
    ],
    
    dependencies: [
        
       .package(url: "https://github.com/engingulek/ClutchCoreKit",from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ClutchOnboardingModule",
            
            dependencies: [
                
                .product(name: "ClutchCoreKit", package: "ClutchCoreKit")
            ],
           
           
        )
        
        
    ]
)
