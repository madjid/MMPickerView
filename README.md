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


#### Example 1 - Show with an array of strings.
```objective-c
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];

  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:nil
                          completion:^(NSString *selectedString) {
   							//selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
  }];
```

#### Example 2 - Show with an array of objects.
```objective-c
    
  NSArray *objects = @[@"This is a mix of objects", @14, @13.3, @"A string", @1000];

  [MMPickerView showPickerViewInView:self.view
   						 withObjects:objects
					     withOptions:nil
		    objectToStringConverter:^NSString *(id object) {
			//This is where you convert your object and return a string, for eg. return person.name;
	          return [object description];
   
              }
						 completion:^(id selectedObject) {
					     //The selected object is returned, and you can use the value as you wish
					     //For example: self.label.text = person.name;
					     self.label.text = [selectedObject description];
  }];
```

### Customizing MMPickerView
Both show methods use a `NSDictionary` to set the options of the `MMPickerView`. If you want a native looking PickerView, just set it to nil. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional.

**Options**

- `pickerViewBackgroundColor` - `UIColor`
- `pickerViewTextColor` - `UIColor`
- `toolbarBackgroundColor` - `UIColor`
- `buttonColor` - `UIColor`
- `font` - `UIFont` 
- `yValueFromTop` - `NSInteger`
- `selectedObject` - `id`
- `toolbarBackgroundImage` - `UIImage`


#### Example 3 - Show with an array of strings and with custom colors and custom font.
```objective-c
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  UIFont *customFont  = [UIFont fontWithName:@"Palatino-Bold" size:19.0];
  NSDictionary *options = @{backgroundColor: [UIColor blackColor],
                                  textColor: [UIColor whiteColor],
                               toolbarColor: [UIColor darkGrayColor],
                                buttonColor: [UIColor whiteColor],
                                       font: customFont,
                                     yValue: @5};

  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:options
                          completion:^(NSString *selectedString) {
                            //selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
                          }];
```

### Selected Value
A useful feature is to let the PickerView select whatever was selected last time. This can easily be done with both show methods, as shown in the Example 4.



#### Example 4 - Show with an array of strings set selectedValue on PickerView.

```objective-c
  
@interface ViewController ()

@property (nonatomic, strong) NSString * selectedString;

@end
  
  
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  self.selectedString = [_stringsArray objectAtIndex:0];
  
}


  
- (IBAction)showPickerViewButtonPressed:(id)sender {

  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:@{selectedObject:_selectedString}
                          completion:^(NSString *selectedString) {
    
                            _label.text = selectedString;
                            _selectedString = selectedString;
  }];
  
}

@end  
```

## Credits

MMPickerView is brought to you by [Madjid Mahdjoubi](http://madjid.se). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/madjid/MMPickerView/issues/new). If you're using MMPickerView in your project, attribution would be nice.


