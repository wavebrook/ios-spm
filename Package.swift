// swift-tools-version:5.9

// Wavebrook iOS SDK — public binary distribution.
//
// Thin manifest over the released XCFrameworks (hosted on Wavebrook infrastructure) plus the
// partner SDKs they link (iOS 15+). Consume `WavebrookCore` alone or `WavebrookNetSignal`
// (the curated bundle: core + every adapter + their vendor SDKs, transitively).
//
// IPinfo publishes SPM-only binaries whose manifest would force this package's floor to iOS 14,
// so its three frameworks are referenced here as direct binary targets (IPinfo's own release URLs
// and checksums — nothing is redistributed). CellRebelSDK resolves through its own package.
import PackageDescription

let package = Package(
    name: "Wavebrook",
    platforms: [
        .iOS(.v15)
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
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookCore-2.0.2.xcframework.zip",
            checksum: "3d364b825c8dc46ca2369e960d77dfc1e1ce88c5041d31c2b1a105e019f4633f"
        ),
        .binaryTarget(
            name: "WavebrookNetSignal",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookNetSignal-1.0.2.xcframework.zip",
            checksum: "37efaed308c0799533e62193bde03356328d8a849007a8b60782d3bdd54f1169"
        ),
        .binaryTarget(
            name: "WavebrookAdapterCellRebel",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterCellRebel-1.5.1.1.xcframework.zip",
            checksum: "eb0e3712d82373d0104e6bb26f75639780461f933917fe6c9bada2df4a73a89e"
        ),
        .binaryTarget(
            name: "WavebrookAdapterIPinfo",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterIPinfo-0.6.4.0.xcframework.zip",
            checksum: "f045ef17ddee8a94b627b211f38d8b90e4d644eceafb1ddde95942f42d1ba1c5"
        ),
        .binaryTarget(
            name: "WavebrookAdapterRootlake",
            url: "https://resources.wavebrook.com/sdk/ios/WavebrookAdapterRootlake-1.1.2.0.xcframework.zip",
            checksum: "f5a7186bef9782f794340a9348fcebeca029746e03594f04fb792f9f452ac4ad"
        ),
        .binaryTarget(
            name: "IPinfoKit",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.4/IPinfoKit.xcframework.zip",
            checksum: "a31afd8d4e267a9d6eb8c768d3a076890a8d6568049530c37af02330f7ad7306"
        ),
        .binaryTarget(
            name: "HTTPClient",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.4/HTTPClient.xcframework.zip",
            checksum: "817dc9d9976c6adc87b4eb0976f143022b7c9a687fec35482eefbbbcd54d84df"
        ),
        .binaryTarget(
            name: "Hopscotch",
            url: "https://github.com/ipinfo/apple-device-sdk-xcframeworks/releases/download/0.6.4/Hopscotch.xcframework.zip",
            checksum: "705204031d772d8156b337e44e2f17c4074492bd323485e2d39c8d4241a5ab75"
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
