//
//  MMTestViewController.m
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/7/13.
//  Copyright (c) 2013 GG. All rights reserved.
//


#import "MMTestViewController.h"

@interface MMTestViewController ()

@property (nonatomic, strong) NSArray *stringsArray;
@property (nonatomic, strong) NSArray *objectsArray;
@property (nonatomic, strong) NSArray *numbersArray;
@property (nonatomic, assign) id selectedObject;
@property (nonatomic, strong) NSString * selectedString;

@end

@implementation MMTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  _stringsArray = @[@"Easy to use", @"Time-saver", @"Customizable", @"Only a few lines of code", @"Works with custom fonts"];
  _objectsArray = [NSArray arrayWithObjects: @"hello", @14, @13.3, @"Icecream", @1,  nil];
  
  _selectedObject = [_objectsArray objectAtIndex:0];
  _selectedString = [_stringsArray objectAtIndex:0];
  
}


- (IBAction)showPickerViewButtonPressed:(id)sender {

  /*
   Options:
   
   MMbackgroundColor - UIColor
   MMtextColor - UIColor
   MMtoolbarColor - UIColor
   MMbuttonColor - UIColor
   MMfont - UIFont 
   MMvalueY - NSInteger
   MMselectedObject - An Object ex: a string
   MMtoolbarBackgroundImage  - UIImage
   MMtextAlignment - NSNumber (@0 - Left, @1 - Center, @2 - Right)
   
   ***************
   DON'T FORGET TO ONLY UNCOMMENT ONE EXAMPLE AT A TIME, OTHERWISE YOU WILL HAVE SEVERAL PICKERVIEWS AT THE SAME TIME.
   JUST SAYIN' :-)
   ***************
   */
 
  
  /*
   //Simple PickerView with array of strings
   NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:nil
                          completion:^(NSString *selectedString) {
                            //selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
                          }];
  */
  
  
  /*
  
  //PickerView with Custom look, with array of strings
  UIFont *customFont  = [UIFont fontWithName:@"Palatino-Bold" size:19.0];
  NSDictionary *options = @{MMbackgroundColor:[UIColor clearColor],
                            MMtextColor: [UIColor colorWithRed:0.063 green:0.180 blue:0.216 alpha:1],
                            MMtoolbarColor:[UIColor colorWithRed:0.169 green:0.733 blue:0.847 alpha:1],
                            MMbuttonColor:[UIColor colorWithRed:0.969 green:0.553 blue:0.247 alpha:1],
                            MMfont: customFont,
                            MMvalueY: @5};
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArray
                         withOptions:options
                          completion:^(NSString *selectedString) {
                            //selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
                          }];
  */
  
  
  
  //PickerView with selectedValue functionality, and customized look, with array of strings
   [MMPickerView showPickerViewInView:self.view
                          withStrings:_stringsArray
                          withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                                        MMtextColor: [UIColor blackColor],
                                        MMtoolbarColor: [UIColor whiteColor],
                                        MMbuttonColor: [UIColor blueColor],
                                        MMfont: [UIFont systemFontOfSize:18],
                                        MMvalueY: @3,
                                        MMselectedObject:_selectedString,
                                        MMtextAlignment:@1}
                           completion:^(NSString *selectedString) {
   
                             _label.text = selectedString;
                             _selectedString = selectedString;
   }];
  
  
  
  /*
  //This one looks nice on iOS 7, but not iOS 6.
  //PickerView with selectedValue functionality, and customized look, with array of strings
   
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArray
                         withOptions:@{MMbackgroundColor: [UIColor blackColor],
                                       MMtextColor: [UIColor whiteColor],
                                       MMtoolbarColor: [UIColor blackColor],
                                       MMbuttonColor: [UIColor whiteColor],
                                       MMfont: [UIFont systemFontOfSize:18],
                                       MMvalueY: @3,
                                       MMselectedObject:_selectedString}
                          completion:^(NSString *selectedString) {
                            
                            _label.text = selectedString;
                            _selectedString = selectedString;
                          }];
  */
  
  
  
  /*
  //PickerView using array of objects
  NSArray *objects = @[@"This is a mix of objects", @14, @13.3, @"A string", @1];
  
  [MMPickerView showPickerViewInView:self.view
                         withObjects:objects
                         withOptions:nil
             objectToStringConverter:^NSString *(id object) {
               return [object description];
             }
                          completion:^(id selectedObject) {
                            
                            _label.text = [selectedObject description];
                          }];
  */
  
  
  
  /*
  //PickerView using array of objects, with selectedObject functionality
  [MMPickerView showPickerViewInView:self.view
                         withObjects:_objectsArray
                         withOptions:@{MMselectedObject:_selectedObject}
             objectToStringConverter:^NSString *(id object) {
               return [object description];
             }
                          completion:^(id selectedObject) {
                            _label.text = [selectedObject description];
                            _selectedObject = selectedObject;
                          }];
  */

  
  
}




@end
