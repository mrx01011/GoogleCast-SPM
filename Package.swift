// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GoogleCastSPM",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "GoogleCastSPM", targets: ["GoogleCastWrapper"])
    ],
    targets: [
        .binaryTarget(
            name: "GoogleCast",
            url: "https://github.com/mrx01011/GoogleCast-SPM/releases/download/v1.0.0/GoogleCast.xcframework.zip",
            checksum: "bc2c3c2434ef2895a0388ac3f16932242d3d3ac11805f810dbe7d7bce3bb27f6"
        ),
        // Wrapper target with resources
        .target(
            name: "GoogleCastWrapper",
            dependencies: ["GoogleCast"],
            resources: [
                .copy("Resources/GoogleCastCoreResources.bundle"),
                .copy("Resources/GoogleCastUIResources.bundle"),
                .copy("Resources/MaterialDialogs.bundle")
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("SystemConfiguration")
            ]
        )
    ]
)
