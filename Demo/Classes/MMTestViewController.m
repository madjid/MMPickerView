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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
  _stringsArray = @[@"Easy to use", @"Time-saver", @"Customizable", @"Only a few lines of code", @"Works with custom fonts"];
  
  _numbersArray = @[@12, @11, @123, @22, @5, @12, @11, @123, @22, @5];
  
  _objectsArray = [NSArray arrayWithObjects: @"hello", @14, @13.3, @"Icecream", @1,  nil];
  
  _selectedObject = [_objectsArray objectAtIndex:0];
  
  _selectedString = [_stringsArray objectAtIndex:0];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPickerViewButtonPressed:(id)sender {

  /*
   Options:
   
   pickerViewBackgroundColor - UIColor 
   pickerViewTextColor - UIColor
   toolbarBackgroundColor - UIColor
   buttonColor - UIColor
   font - UIFont 
   yValueFromTop - NSInteger
   selectedObject - An Object ex: a string
   toolbarBackgroundImage  - UIImage
   
   Example 1:
   
   [MMPickerView showPickerViewInView:self.view
   withStrings:_stringsArray
   withOptions:nil
   completion:^(NSString *selectedString) {
   _label.text = selectedString;
   _selectedString = selectedString;
   }];
   
   
   Example 2:
   
   [MMPickerView showPickerViewInView:self.view
   withStrings:_stringsArray
   withOptions:@{backgroundColor: [UIColor whiteColor],
   textColor: [UIColor blackColor],
   toolbarColor: [UIColor whiteColor],
   buttonColor : [UIColor blueColor],
   font : [UIFont systemFontOfSize:18],
   yValue:@3,
   selectedObject:_selectedString}
   completion:^(NSString *selectedString) {
   _label.text = selectedString;
   _selectedString = selectedString;
   }];
   
  
   Example 3:
   
   [MMPickerView showPickerViewInView:self.view
   withObjects:_objectsArray
   withOptions:@{selectedObject:_selectedObject}
   objectToStringConverter:^NSString *(id object) {
   return [object description];
   }
   completion:^(id selectedObject) {
   _label.text = [selectedObject description];
   _selectedObject = selectedObject;
   }];
   
  */
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:nil
                          completion:^(NSString *selectedString) {
                            
                            self.label.text = selectedString;
                            
                          }];
  
  
  /*
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArray
                         withOptions:@{backgroundColor: [UIColor whiteColor],
                                       textColor: [UIColor blackColor],
                                       toolbarColor: [UIColor whiteColor],
                                       buttonColor : [UIColor blueColor],
                                       font : [UIFont systemFontOfSize:18],
                                       yValue:@3,
                                       selectedObject:_selectedString}
                          completion:^(NSString *selectedString) {
    
                            _label.text = selectedString;
                            _selectedString = selectedString;
  }];
 */
 
  
  /*
  [MMPickerView showPickerViewInView:self.view
                         withObjects:_objectsArray
                         withOptions:@{selectedObject:_selectedObject}
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
