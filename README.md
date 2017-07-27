# BPBlockActivityIndicator

**BPBlockActivityIndicator** is a clean and easy-to-use Activity Indicator meant to display the progress of an ongoing task on iOS. </br>

## Demo

<img src="https://user-images.githubusercontent.com/9531750/28249005-0ff9b0b4-6a89-11e7-906a-d00e2ffdf7fa.gif" width="320" height="590" />

## Requirements
- Deployment Target - `iOS 8.0`
- Swift Version - `Swift 3.2`

## Installation

### CocoaPods
BPBlockActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BPBlockActivityIndicator"
```

### Carthage
simply add the following line to your Cartfile:

``` ruby
github "ppth0608/BPBlockActivityIndicator"
```

### Manual
Copy the folder `Source/` to your project

## Usage
Using BPBlockActivityIndicator isn't difficult at all. There are two actual ways of implementing it in your project:
- Storyboard setup
- Manual setup

### Storyboard Setup
First, you're about to add 1 UIViews to your Storyboard and setup custom classes (You can set custom classes in **Identity Inspector**) as it shown in the picture below

<img width="813" alt="2017-07-17 12 51 06" src="https://user-images.githubusercontent.com/9531750/28249057-172a6648-6a8a-11e7-9f7d-4ec226279fe0.png" width="1000" height="650" />

and, add Outlet in to your code
```Swift
@IBOutlet weak var blockIndicator: BPBlockActivityIndicator!
```

### Manual setup
if for some reason you'd like to setup **BPBlockActivityIndicator** manually you have to do the following step
```Swift
var blockIndicatorindicator: BPBlockActivityIndicator!

override func viewDidLoad() {
    super.viewDidLoad()

    // initialize BPBlockActivityIndicator programmatically        
    blockIndicatorindicator = BPBlockActivityIndicator(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    view.addSubview(blockIndicatorindicator)
}
```

### Animate & Stop
You can easily animate and stop animation
```Swift
@IBAction func startAnimate(_ sender: Any) {
    blockIndicator.animate()
}

@IBAction func stopAnimate(_ sender: Any) {
    blockIndicator.stop()
}
```

### Customize
if you want to setup animation speed or color of blocks(if using storyboard) you can set property in **Identity Inspector** as it shown in the picture below

<img width="359" alt="2017-07-17 12 51 51" src="https://user-images.githubusercontent.com/9531750/28249065-2bb96d48-6a8a-11e7-9cb0-c3af02447c5f.png">

or (if using code) , you can call methods as it shown in the code below
```Swift
blockIndicatorindicator = BPBlockActivityIndicator(frame: CGRect(x: 30, y: 30, width: 40, height: 40))
            .movementSpeed(0.2)
            .blockColor(.cyan)
view.addSubview(blockIndicatorindicator)
```

Default setting is shown in below
- Animation Speed : 0.6
- Color of blocks : Blue

## Author

Ben.Park, ppth0608@naver.com

## Designed By

Suna.Shin, tjsdk2309@gmail.com

## Contribute

always welcome :)
please, pull request for **BPBlockActivityIndicator**

## License

BPBlockActivityIndicator is available under the MIT license. See the LICENSE file for more info.
