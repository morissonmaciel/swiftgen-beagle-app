# swiftgen-beagle-app

A simple and easy understanding structural iOS project using server driven with Beagle, intended to be used as a template for starter Swift projects.

## Pre-requisites

To start using this project as template you need at least this three pre-requisites in your macOS machine:

1. Any `git` client instaled, as `git cli` or `Github Desktop` 
2. `Xcode` 11.x or earlier installed and `command line tools` proper initiated
3. `XcodeGen` installed through `brew install xcodegen` command. More intructions at https://github.com/yonaskolb/XcodeGen

## Usage

1. Simple clone this repository using `git clone https://github.com/morissonmaciel/swiftgen-beagle-app.git ~/.swiftgen-beagle-app`
2. Create a structural copy for your project folder using `cp -R ~/.swiftgen-beagle-app ./MyIOSApp`
3. Enter your project folder using `cd ./MyIOSApp`
4. Open the `project.yml` file using either one of following commands: `nano project.yml` or `open project.yml`
5. Replace `BeagleApp` text entries with `MyIOSApp` to futher proper generate targets for your app
6. Remove the `.git` folder, preventing any source control conflict: `rm -rf .git`

Obs: the final results expected for the file would be...

``` yml
name: MyIOSApp
packages:
    ViewInspector:
        url: https://github.com/nalexn/ViewInspector
        from: "0.9.2"
    Beagle:
        url: https://github.com/ZupIT/beagle-ios.git
        from: "2.1.0"
    SnapshotTesting:
        url: https://github.com/pointfreeco/swift-snapshot-testing.git
        from: "1.10.0"
targets:
    MyIOSApp:
        type: application
        platform: iOS
        deploymentTarget: "13.0"
        sources: [App]
        settings:
            base:
                INFOPLIST_FILE: App/Info.plist
                ENTITLEMENTS_FILE: App/App.entitlements
                PRODUCT_BUNDLE_IDENTIFIER: com.codename.ios.app
        scheme:
            testTargets:
                - MyIOSAppTests
        dependencies:
            - package: Beagle
    MyIOSAppTests:
        type: bundle.unit-test
        platform: iOS
        deploymentTarget: "13.0"
        sources:
            - path: AppTests
              excludes:
                - ReferenceImages/**
        settings:
            base:
                INFOPLIST_FILE: AppTests/Info.plist
        dependencies:
            - target: MyIOSApp
            - package: ViewInspector
            - package: SnapshotTesting
```

7. Run `xcodegen` command and wait for project generation
8. Open your project using `open MyIOSApp.xcodeproj/`

## Remarks

This project is a basic `iOS app` with `both executable and tests targets configured with minimal setup` for your project. Feel free to add `cocoapods` `carthage` or any `swift package` to your project.
