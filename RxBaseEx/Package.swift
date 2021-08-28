// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "RxBaseEx",
    //platforms: [ .iOS(.v13) ],
    dependencies: [
		.package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.2.0"))
        ],
      targets: [
        .target(name: "RxBaseEx", dependencies: ["RxSwift", "RxCocoa"])
      ]
 )
    
