// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let target = Target.binaryTarget(name: "QDPublisher", path: "QDPublisher.xcframework")
target.dependencies = ["Gzip"]
let package = Package(
    name: "QDPublisher Package",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v8)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "QDPublisher Library",
            targets: ["QDPublisher"]
        )
        
    ],
    dependencies: [
        .package(name: "Gzip", url: "https://github.com/1024jp/GzipSwift.git", from: "5.1.0")
    ],
    targets: [target]
)

