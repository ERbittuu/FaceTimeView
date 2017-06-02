# FaceTimeView

[![CI Status](http://img.shields.io/travis/erbittuu/FaceTimeView.svg?style=flat)](https://travis-ci.org/erbittuu/FaceTimeView)
[![Version](https://img.shields.io/cocoapods/v/FaceTimeView.svg?style=flat)](http://cocoapods.org/pods/FaceTimeView)
[![License](https://img.shields.io/cocoapods/l/FaceTimeView.svg?style=flat)](http://cocoapods.org/pods/FaceTimeView)
[![Platform](https://img.shields.io/cocoapods/p/FaceTimeView.svg?style=flat)](http://cocoapods.org/pods/FaceTimeView)

![FaceTimeViewLogo](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/FaceTimeView_logo.png)

## Demo

![](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/FaceTimeView.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FaceTimeView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FaceTimeView"
```

### 2. Manual

Add `FaceTimeView.swift` file into your project.

## Usage

### 1. Import FaceTimeView in any class you want to use it.

```swift
    import FaceTimeView
```


### 2 Add direcly into the code.

```swift
import UIKit
import FaceTimeView

            // Start live effect using front camera
            startLiveFor(type: .frontCamera, blurStyle: .light)
            
            // Start live effect using back camera
            startLiveFor(type: .backCamera)
 
            // Start live effect using gif image 
            let path = Bundle.main.path(forResource: "giphy", ofType: "gif")
            let gifURL = URL(fileURLWithPath: path!)
            
            startLiveFor(type: .gif(gifURL))
            
            // Start live effect using videos
            
            let path1 = Bundle.main.path(forResource: "v1", ofType: "mp4")
            let videoURL1 = URL(fileURLWithPath: path1!)
            
            let path2 = Bundle.main.path(forResource: "v2", ofType: "mp4")
            let videoURL2 = URL(fileURLWithPath: path2!)
            
            let path3 = Bundle.main.path(forResource: "v3", ofType: "mp4")
            let videoURL3 = URL(fileURLWithPath: path3!)
            
            startLiveFor(type: .video([videoURL1,videoURL2,videoURL3]))
```

## Screenshots
![alt Home](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/home.PNG)
![alt ss1](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/ss1.PNG)
![alt ss2](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/ss2.PNG)
![alt ss3](https://github.com/ERbittuu/FaceTimeView/blob/master/Resource/ss3.PNG)

## Contribution

Feel free to raise issue and pull requests accepted to imrove this library.

## Author

erbittuu , erbittuu@gmail.com

## License

FaceTimeView is available under the MIT license. See the LICENSE file for more info.