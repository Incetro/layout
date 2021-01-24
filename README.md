

# Layout

<div align = "center">
  <a href="https://cocoapods.org/pods/swift-layout">
    <img src="https://img.shields.io/cocoapods/v/swift-layout.svg?style=flat" />
  </a>
  <a href="https://github.com/incetro/swift-layout">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" />
  </a>
  <a href="https://github.com/incetro/swift-layout#installation">
    <img src="https://img.shields.io/badge/compatible-swift%205.0-orange.svg" />
  </a>
</div>
<div align = "center">
  <a href="https://cocoapods.org/pods/swift-layout" target="blank">
    <img src="https://img.shields.io/cocoapods/p/swift-layout.svg?style=flat" />
  </a>
  <a href="https://cocoapods.org/pods/swift-layout" target="blank">
    <img src="https://img.shields.io/cocoapods/l/swift-layout.svg?style=flat" />
  </a>
  <br>
  <br>
</div>

*Layout* is simple layout design wrapper, that will make it easier for you to work with it.


- [Usage](#Usage)
	1. [Layout](#layout)
	2. [Constraint](#constraint)
	3. [Extensions](#extensions)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Authors](#license)

## Usage <a name="Usage"></a>

To use a *Layout*, all you will need to import 'Layout' module into your swift file:

```
import Layout

```

### 1. Layout <a name="layout"></a>

*Layout* have many properties will help you more easily access the desired constraints.
For example like this:

```
/// Your view
let view = UIView()

view.top
view.left
view.right
view.bottom
view.height
view.width
view.centerX
view.centerY
view.topLeftAngle
view.topRightAngle
view.bottomLeftAngle
view.bottomRightAngle

```

Layout has many useful methods for sizing, attaching one view to another, they are used like this:

```
/// Your views
let firstView = UIView()
let secondView = UIView()
let thirdView = UIView()

/// Pin current view to superview with some insets
firstView
	.prepareForAutolayout()
	.pinToSuperview()

/// Setup size and connect left anchor to other view
firstView.addSubview(secondView.prepareForAutolayout())
secondView
    .size(
        width: firstView.frame.width / 2,
        height: firstView.frame.height / 2
    )
	.top(to: firstView.top)
	.left(to: firstView.left)
	
/// Pin edges to other view with insets
secondView.addSubview(thirdView.prepareForAutolayout())
thirdView
	.pinEdges(to: secondView, left: 5, right: 5, top: 0, bottom: 0)
    
/// Pin view to other view using only those sides
secondView.addSubview(thirdView.prepareForAutolayout())
thirdView
    .safePin(to: thirdView, withInsets: .zero)
    
/// Full pin view to other view using all sides with insets
secondView.addSubview(thirdView.prepareForAutolayout())
thirdView
    .fullPin(to: thirdView, withInsets: .zero)
```


### 2. Constraint <a name="constraint"></a>

*Layout* contains some methods for working with constraints, they are used like this:

```
/// Set current constraint equal to other constraint
firstView
	.height.equal(to: secondView.height)

/// Set current constraint less than or equal to other constraint
firstView
	.height.lessThanOrEqual(to: secondView.height, multiplier: 2)

/// Set current constraint greater than or equal to other constraint
firstView
	.height.greaterThanOrEqual(to: secondView.height, multiplier: 2)

```

### 3. Extensions <a name="extensions"></a>

*Layout* comes with a couple of extensions: `UIViewController` and `Array`

These properties will help you more easily access to ancors of safe area layout guide.

```
// MARK: - UIViewController

public extension UIViewController {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        view.safeAreaLayoutGuide.topAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        view.safeAreaLayoutGuide.bottomAnchor
    }

    var safeTop: Constraint<NSLayoutYAxisAnchor> {
        Constraint<NSLayoutYAxisAnchor>(constraint: safeTopAnchor)
    }

    var safeBottom: Constraint<NSLayoutYAxisAnchor> {
        Constraint<NSLayoutYAxisAnchor>(constraint: safeBottomAnchor)
    }
}
```

`Array` extension make your some views array as stack view. There are two methods, for vertical and horizontal stacking. It's easy to use them:

```
/// Your views array and needed view
viewsArray.verticalStack(in: yourView, spacing: 20, pinToEdgesWithSpacing: false)

/// Or horizontal
viewsArray.horizontalStack(in: yourView)
```


## Requirements
- iOS 11.0+
- tvOS 11.0+
- Xcode 12.0
- Swift 5

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Installation <a name="installation"></a>

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To install it using [CocoaPods](https://cocoapods.org), simply add the following line to your Podfile:

```ruby
use_frameworks!

target "<Your Target Name>" do
pod "swift-layout", :git => "https://github.com/Incetro/layout", :tag => "[0.0.1]"
end
```
Then, run the following command:

```bash
$ pod install
```
### Manually

If you prefer not to use any dependency managers, you can integrate *Layout* into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add * Layout* as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/incetro/layout.git
  ```

- Open the new `Layout` folder, and drag the `Layout.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Layout.xcodeproj ` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Layout.xcodeproj ` folders each with two different versions of the `Layout.framework` nested inside a `Products` folder.

- Select the `Layout.framework`.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Nio` will be listed as either `Layout iOS`.

- And that's it!

  > The `Layout.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.
  


## Authors <a name="authors"></a>

Gasol: 1ezya007@gmail.com, incetro: incetro@ya.ru


## License <a name="license"></a>

*Layout* is available under the MIT license. See the LICENSE file for more info.
