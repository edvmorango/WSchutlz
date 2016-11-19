import PackageDescription

let package = Package(
    name: "WSchultz",
    dependencies: [
         .Package(url: "https://github.com/OpenKitten/MongoKitten.git", majorVersion: 2, minor: 0)    ]
)
