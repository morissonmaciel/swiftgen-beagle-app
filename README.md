# swiftgen-beagle-app

A simple and easy understanding structural iOS project using server driven with Beagle, intended to be used as a template for starter Swift projects.

<img width="1582" alt="Xnapper-2023-02-06-22 23 06" src="https://user-images.githubusercontent.com/11509104/217124281-772de63f-7a07-4aa7-be09-07f56264fe44.png">

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
name: BeagleApp
packages:
    ViewInspector:
        url: https://github.com/nalexn/ViewInspector
        version: "0.9.1"
    SnapshotTesting:
        url: https://github.com/pointfreeco/swift-snapshot-testing.git
        version: "1.10.0"
    Beagle:
        url: https://github.com/ZupIT/beagle-ios.git
        version: "2.1.1"
targets:
    BeagleApp:
        type: application
        platform: iOS
        deploymentTarget: "13.0"
        sources: [App]
        settings:
            base:
                INFOPLIST_FILE: App/Info.plist
                ENTITLEMENTS_FILE: App/App.entitlements
                PRODUCT_BUNDLE_IDENTIFIER: com.codename.ios.beagle.app
        scheme:
            testTargets:
                - BeagleAppTests
            gatherCoverageData: true
        dependencies:
            - package: Beagle
    BeagleAppTests:
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
            - target: BeagleApp
            - package: ViewInspector
            - package: SnapshotTesting
```

7. Run `xcodegen` command and wait for project generation
8. Open your project using `open MyIOSApp.xcodeproj/`

## Remarks

This project is a basic `iOS app` with `both executable and tests targets configured with minimal setup` for your project. Feel free to add `cocoapods` `carthage` or any `swift package` to your project.
