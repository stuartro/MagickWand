// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MagickWand",
    products: [
        .library(name: "MagickWand", targets: ["MagickWand"])
    ],
    targets: [
        .systemLibrary(
            name: "CMagickWand",
            pkgConfig: "MagickWand-6.Q16",
            providers: [
                .brew(["imagemagick@6"]),
                .apt(["libmagickwand-6.q16-dev"])
            ]
        ),
        .target(
            name: "MagickWand",
            dependencies: ["CMagickWand"]
        ),
        .testTarget(
            name: "MagickWandTests",
            dependencies: ["MagickWand"]
        ),
    ]
)
