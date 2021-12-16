// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShowcaseData",
    platforms: [.iOS(.v13), .macOS(.v10_11)],
    products: [
        .library(name: "ShowcaseData", targets: ["ShowcaseData"]),
        .library(name: "ShowcaseDataMocks", targets: ["ShowcaseDataMocks"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt.git", .upToNextMajor(from: "6.1.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", .upToNextMajor(from: "5.2.7")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.2.1")),
        .package(name: "SnapshotTesting",
                 url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 .upToNextMajor(from: "1.9.0")),
        .package(name: "ShowcaseExtensions",
                 url: "https://github.com/lukaszspaczynski/showcase-ios-extensions.git",
                 .upToNextMajor(from: "1.0.2"))
    ],
    targets: [
        .target(
            name: "ShowcaseData",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                "ShowcaseExtensions",
                "RxSwiftExt",
                "Kanna"],
            resources: [
                .copy("Resources/bio-link-template.rtf"),
                .copy("Resources/bio-template.rtf")
            ]),
        .target(
            name: "ShowcaseDataMocks",
            dependencies: [
                .target(name: "ShowcaseData"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                "ShowcaseExtensions",
                "RxSwiftExt",
                "Kanna"
            ],
            resources: [
                .copy("Resources/HTMLs/BioResponseValid.html"),
                .copy("Resources/Images/mocked-image.jpeg"),
                .copy("Resources/JSONs/MoviesResponseValid.json"),
                .copy("Resources/RTFs/mocked-bio-template.rtf"),
                .copy("Resources/RTFs/mocked-biolink-template.rtf"),
                .copy("Resources/RTFs/mocked-dummy-template.rtf"),
            ]),
        .testTarget(
            name: "ShowcaseDataTests",
            dependencies: [
                .target(name: "ShowcaseData"),
                .target(name: "ShowcaseDataMocks"),
                .product(name: "RxBlocking", package: "RxSwift"),
                .product(name: "RxTest", package: "RxSwift"),
                "Nimble",
                "SnapshotTesting"],
            exclude: [
                "Source/Services/Image/__Snapshots__",
                "Source/Services/Image/FilterProcessors/__Snapshots__"
            ],
            resources: [
                .copy("Resources/reference-image.jpeg")
            ])
    ]
)
