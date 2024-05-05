# UniversitiesList

## Building And Running The Project (Requirements)
* Swift 5.0+
* Xcode 15.0
* iOS 13.0+

## Setup Configs
- Checkout develop branch to run the latest version
- Open the terminal and navigate to the project root directory.
- Make sure you have cocoa pods set up, then run: pod install
- Open the project by double-clicking the `UniversitiesList.xcworkspace` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = UniversitiesList
PRODUCT_BUNDLE_IDENTIFIER = task.UniversitiesList

#targets:
* UniversitiesList
* UniversitiesListTests
* UniversitiesListUITests

```

## Build
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app

## Architecture
* VIPER

## Folders Structure
* SupportingFiles: Group app shared files, like app delegate, assets, info.plist, ...etc
* Modules: Include separate modules, UniversitiesList, UniversityDetails.
* Extensions: Group of app extensions files.
* Network: Group of app Network files.

## Dependencies
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [RealmSwift](https://github.com/realm/realm-swift)
* [SwiftLint](https://github.com/realm/SwiftLint)

## TODOs

- [ ] Add XCConfig
- [ ] Add more error handling
- [ ] Add CD pipelines using GitHub actions.
- [ ] Add more unit tests
- [ ] Add UI-tests
