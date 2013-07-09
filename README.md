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

### Examples:

#### Example 1 - Array of strings.
```objective-c

- (IBAction)showPickerViewButtonPressed:(id)sender {
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];

  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:nil
                          completion:^(NSString *selectedString) {
   							//selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
   }];
}
```

#### Example 2 - Array of objects.
```objective-c
   [MMPickerView showPickerViewInView:self.view
   						  withObjects:_objectsArray
					      withOptions:nil
		      objectToStringConverter:^NSString *(id object) {
				//This is where you convert your object and return a string, for eg. return person.name;
		        return [object description];
   
   }
						   completion:^(id selectedObject) {
						     //The selected object is returned, and you can use the value as you wish, for eg self.label.text = person.name;
						     self.label.text = [selectedObject description];
   }];
```

### Customizing the PickerView
Both show methods use a NSDictionary to set the options of the PickerView. If you want a native looking PickerView, just set it to nil. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional.

**Options**

- pickerViewBackgroundColor - UIColor
- pickerViewTextColor - UIColor
- toolbarBackgroundColor - UIColor
- buttonColor - UIColor
- font - UIFont 
- yValueFromTop - NSInteger
- selectedObject - An Object
- toolbarBackgroundImage - UIImage

```objective-c
NSDictionary *options = @{backgroundColor: [UIColor whiteColor],
   textColor: [UIColor blackColor],
   toolbarColor: [UIColor whiteColor],
   buttonColor : [UIColor blueColor],
   font : [UIFont systemFontOfSize:18],
   yValue:@3};
```


### Customizing the PickerView
Both show methods use a NSDictionary to set the options of the PickerView. If you want a native looking PickerView, just set it to nil. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional.

**Options**

- pickerViewBackgroundColor - UIColor
- pickerViewTextColor - UIColor
- toolbarBackgroundColor - UIColor
- buttonColor - UIColor
- font - UIFont 
- yValueFromTop - NSInteger
- selectedObject - An Object
- toolbarBackgroundImage - UIImage

```objective-c
NSDictionary *options = @{backgroundColor: [UIColor whiteColor],
   textColor: [UIColor blackColor],
   toolbarColor: [UIColor whiteColor],
   buttonColor : [UIColor blueColor],
   font : [UIFont systemFontOfSize:18],
   yValue:@3};
```
### Examples

```objective-c

- (IBAction)showPickerViewButtonPressed:(id)sender {

 NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];

[MMPickerView showPickerViewInView:self.view
   withStrings:strings
   withOptions:nil
   completion:^(NSString *selectedString) {
   
   self.label.text = selectedString;
   
   }];
}
```

### Customizing the PickerView
Both show methods use a NSDictionary to set the options of the PickerView. If you want a native looking PickerView, just set it to nil. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional.

**Options**

- pickerViewBackgroundColor - UIColor
- pickerViewTextColor - UIColor
- toolbarBackgroundColor - UIColor
- buttonColor - UIColor
- font - UIFont 
- yValueFromTop - NSInteger
- selectedObject - An Object
- toolbarBackgroundImage - UIImage

```objective-c
NSDictionary *options = @{backgroundColor: [UIColor whiteColor],
   textColor: [UIColor blackColor],
   toolbarColor: [UIColor whiteColor],
   buttonColor : [UIColor blueColor],
   font : [UIFont systemFontOfSize:18],
   yValue:@3};
```


### Customizing the PickerView
Both show methods use a NSDictionary to set the options of the PickerView. If you want a native looking PickerView, just set it to nil. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional.

**Options**

- pickerViewBackgroundColor - UIColor
- pickerViewTextColor - UIColor
- toolbarBackgroundColor - UIColor
- buttonColor - UIColor
- font - UIFont 
- yValueFromTop - NSInteger
- selectedObject - An Object
- toolbarBackgroundImage - UIImage

```objective-c
NSDictionary *options = @{backgroundColor: [UIColor whiteColor],
   textColor: [UIColor blackColor],
   toolbarColor: [UIColor whiteColor],
   buttonColor : [UIColor blueColor],
   font : [UIFont systemFontOfSize:18],
   yValue:@3};
```