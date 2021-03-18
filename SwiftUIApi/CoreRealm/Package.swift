// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRealm",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreRealm",
            targets: ["CoreRealm"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", .upToNextMajor(from: "10.7.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreRealm",
            dependencies: ["Alamofire",
                           "Realm"]),
        .testTarget(
            name: "CoreRealmTests",
            dependencies: ["CoreRealm"]),
    ]
)
