MMPickerView
============

An easy to use and customizable PickerView for your iOS app.


## Installation

### From CocoaPods

Add `pod 'MMPickerView'` to your Podfile.

### Manually

_**Important note if your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `MMPickerView.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `MMPickerView/MMPickerView` folder into your project.
* Add the **CoreGraphics** framework to your project.

## Usage

(see sample Xcode project in `/Demo`)

MMPickerView is created as a singleton (i.e. it doesn't need to be explicitly allocated and instantiated; you directly call `[MMPickerView method]`).

### Showing the PickerView

You can show the PickerView:

```objective-c
+(void)showPickerViewInView: (UIView *)view
                withStrings: (NSArray *)strings
                withOptions: (NSDictionary *)options
                 completion: (void(^)(NSString *selectedString))completion;

+(void)showPickerViewInView: (UIView *)view
                withObjetcs: (NSArray *)objects
                withOptions: (NSDictionary *)options
    objectToStringConverter: (NSString *(^)(id object))converter
       completion: (void(^)(id selectedObject))completion;
```