// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "DSSDKCore",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DSSDKCore", targets: ["DSSDKCore"])
    ],
    dependencies: [],
    targets: [
        // 1) Optional / other vendor binaries you still ship
        .binaryTarget(name: "llama", path: "./llama.xcframework"),

        // 2) Your SDK’s XCFramework
        .binaryTarget(name: "DSSDK", path: "./DSSDK.xcframework"),

        // 3) Wrapper that re-exports DSSDK (+ llama if you want)
        .target(
            name: "DSSDKCore",
            dependencies: [
                "DSSDK",
                "llama",
            ],
            path: "Sources/DSSDKCore",
            resources: [
                .process("Resources/form-js.css"),
                .process("Resources/form-viewer.umd.js"),
            ]
        ),
    ]
)