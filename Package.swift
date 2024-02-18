//// swift-tools-version:5.9
//import PackageDescription
//
//let package = Package(
//    name: "NC3",
//    platforms: [
//       .macOS(.v13)
//    ],
//    dependencies: [
//        // 💧 A server-side Swift web framework.
//        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
//    ],
//    targets: [
//        .executableTarget(
//            name: "App",
//            dependencies: [
//                .product(name: "Vapor", package: "vapor"),
//            ]
//        ),
//        .testTarget(name: "AppTests", dependencies: [
//            .target(name: "App"),
//            .product(name: "XCTVapor", package: "vapor"),
//
//            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
//            .product(name: "Vapor", package: "vapor"),
//        ])
//    ]
//
//)


// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "NC3",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"), // Add Fluent package
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"), // Add SQLite driver for Fluent 
        
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"), // Add Fluent dependency
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"), // Add SQLite driver dependency
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),

            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
        ])
    ]
)
