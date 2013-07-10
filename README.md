MMPickerView
============

An easy to use and customizable PickerView for your iOS app. With animation, design options, selected value and previously selected value functionality.
Works with iOS 6 and even better in iOS 7, because it let's you change the background color of the PickerView.


<br />

![MMPickerView](https://dl.dropboxusercontent.com/u/73895323/MMPickerView-GitHub.png)
Images to the left: iOS 6. Images to the right: iOS 7.

<br />
## Installation

### From CocoaPods

Add `pod 'MMPickerView'` to your Podfile.

### Manually

_**Important note if your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `MMPickerView.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `MMPickerView/MMPickerView` folder into your project.
* Make sure you have the **CoreGraphics** framework in your project.

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
Both show methods use a `NSDictionary` to set the options of the `MMPickerView`. If you want a native looking PickerView, just `withOptions: nil`. In case of customization, use any of the different properties to customize the PickerView. All of the properties are optional, which means that if you only want to change one thing, like for eg the text color you can do like this, `withOptions: @{MMtextColor: [UIColor redColor]}`

**Options**

     
- `MMbackgroundColor` - `UIColor` 
- `MMtextColor` - `UIColor` 
- `MMtoolbarBackgroundColor` - `UIColor` 
- `MMbuttonColor` - `UIColor` 
- `MMfont` - `UIFont` 
- `MMValueY` - `NSInteger` 
- `MMselectedObject` - `id` 
- `MMtoolbarBackgroundImage` - `UIImage`


#### Example 3 - Show with an array of strings and with custom colors and custom font.
```objective-c
 /*
  Options:
  MMbackgroundColor - UIColor - The background color of the PickerView (>=iOS 7)
  MMtextColor - UIColor - The text color of the PickerView
  MMtoolbarBackgroundColor - UIColor - The background color of the toolbar
  MMbuttonColor - UIColor - The background color (<= iOS 6) or text color (>=iOS 7) of the Done button
  MMfont - UIFont - The font of the PickerView labels
  MMValueY - NSInteger - The Y value from the top of every label in the PickerView, useful when changing font/font-size.
  MMselectedObject - id - The selected object presented in the PickerView, an object from the array, for eg. [yourArray objectAtIndex:0];
  MMtoolbarBackgroundImage - UIImage - The background image of the toolbar (320 x 44 for non retina, 640 x 88 for retina)
 */
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  UIFont *customFont  = [UIFont fontWithName:@"Palatino-Bold" size:19.0];
  NSDictionary *options = @{MMbackgroundColor: [UIColor blackColor],
                                  MMtextColor: [UIColor whiteColor],
                               MMtoolbarColor: [UIColor darkGrayColor],
                                MMbuttonColor: [UIColor whiteColor],
                                       MMfont: customFont,
                                     MMValueY: @5};

  
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

MMPickerView is brought to you by **Madjid Mahdjoubi**. If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/madjid/MMPickerView/issues/new). If you're using MMPickerView in your project, attribution would be nice.


