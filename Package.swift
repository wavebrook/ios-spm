// swift-tools-version:5.9

// Wavebrook iOS SDK — public binary distribution.
//
// Thin manifest over the released XCFrameworks (hosted on Wavebrook infrastructure) plus the
// partner SDKs they link. Consume `WavebrookCore` alone (iOS 13+) or `WavebrookNetSignal`
// (iOS 15+ — the curated bundle: core + every adapter + their vendor SDKs, transitively).
//
// IPinfo publishes SPM-only binaries whose manifest would force this package's floor to iOS 14,
// so its three frameworks are referenced here as direct binary targets (IPinfo's own release URLs
// and checksums — nothing is redistributed). CellRebelSDK resolves through its own package.
import PackageDescription

let package = Package(
    name: "Wavebrook",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "WavebrookCore", targets: ["WavebrookCore"]),
        .library(name: "WavebrookNetSignal", targets: ["WavebrookNetSignalBundle"])
    ],
    dependencies: [
        .package(url: "https://github.com/cellrebel/CellRebelSDK-iOS", exact: "1.5.1")
    ],
    targets: [
        .binaryTarget(
            name: "WavebrookCore",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookCore-2.0.0.xcframework.zip",
            checksum: "5fb3f508736a1512c3ca384f7dbb3a575c0018bfd61d2206e37c70856384f825"
        ),
        .binaryTarget(
            name: "WavebrookNetSignal",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookNetSignal-1.0.0.xcframework.zip",
            checksum: "022fde8ed2ed5a4a81a7927c130d248266f2e471c5d447627cb677595234a171"
        ),
        .binaryTarget(
            name: "WavebrookAdapterCellRebel",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterCellRebel-1.5.1.0.xcframework.zip",
            checksum: "4912a9fc1bd352926fedb60f28ca5341224c96e7ca5cc4383bbe3fd10fc2b824"
        ),
        .binaryTarget(
            name: "WavebrookAdapterIPinfo",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterIPinfo-0.6.0.0.xcframework.zip",
            checksum: "83b81be891ed4266ed541d62877bda5167ef3e8df96f51117b7e06fc43a40436"
        ),
        .binaryTarget(
            name: "WavebrookAdapterRootlake",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterRootlake-1.1.0.1.xcframework.zip",
            checksum: "33d103306015a0d5ebb649c7e2bc6267c71d3da711eb51d06e0c9e6c5291a81f"
        ),
        .binaryTarget(
            name: "IPinfoKit",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.0/IPinfoKit.xcframework.zip",
            checksum: "25bc5e9cede924e870eee4cc0ca9db44f34adef4e7fff9f2e49f46029cbfb551"
        ),
        .binaryTarget(
            name: "HTTPClient",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.0/HTTPClient.xcframework.zip",
            checksum: "f7615b596cb6fa35f9954ab3c083c7a7f290324b47043e242f0c9e18e9bb5671"
        ),
        .binaryTarget(
            name: "Hopscotch",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.0/Hopscotch.xcframework.zip",
            checksum: "bb547dfefad20b1e42d15e45676c16e14533f6b383b3dd671a995bb99b0b071f"
        ),
        .target(
            name: "WavebrookNetSignalBundle",
            dependencies: [
                "WavebrookCore",
                "WavebrookNetSignal",
                "WavebrookAdapterCellRebel",
                "WavebrookAdapterIPinfo",
                "WavebrookAdapterRootlake",
                "IPinfoKit",
                "HTTPClient",
                "Hopscotch",
                .product(name: "CellRebelSDK", package: "CellRebelSDK-iOS")
            ],
            path: "Sources/WavebrookNetSignalBundle"
        )
    ]
)
