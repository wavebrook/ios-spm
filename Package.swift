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
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookCore-2.0.0-beta.7.xcframework.zip",
            checksum: "92522ad0d9031a2198392610de583f6832ee188d6b735a93931438c1598dd132"
        ),
        .binaryTarget(
            name: "WavebrookNetSignal",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookNetSignal-1.0.0-beta.10.xcframework.zip",
            checksum: "016c908be68106800d9e490c77902b10c113339b4484ab4540ea1d33de5ef178"
        ),
        .binaryTarget(
            name: "WavebrookAdapterCellRebel",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterCellRebel-1.5.1.0-beta.2.xcframework.zip",
            checksum: "350509dcfcba7037b5ca40739a6f9e82050bf0702a0769410efc7e7c92a19f2e"
        ),
        .binaryTarget(
            name: "WavebrookAdapterIPinfo",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterIPinfo-0.6.0.0-beta.1.xcframework.zip",
            checksum: "ba62c5200b06904c990c0ce97ab5421403acb2516cce6647aa4402752caf7d49"
        ),
        .binaryTarget(
            name: "WavebrookAdapterRootlake",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterRootlake-1.1.0.1-beta.3.xcframework.zip",
            checksum: "14d2e31bc571ee262fa51e432cb7d7cfa84ee36ad8fddbd0f57173b3c9c57407"
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
