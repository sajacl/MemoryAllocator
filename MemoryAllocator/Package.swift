// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MemoryAllocator",
    products: [
        .library(
            name: "MemoryAllocator",
            targets: ["MemoryAllocator"]
        ),
    ],
    targets: [
        .target(
            name: "MemoryAllocator"
        ),
        .testTarget(
            name: "MemoryAllocatorTests",
            dependencies: ["MemoryAllocator"]
        ),
    ]
)
