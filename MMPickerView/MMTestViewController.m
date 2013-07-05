//
//  MMTestViewController.m
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/7/13.
//  Copyright (c) 2013 GG. All rights reserved.
//


#import "MMTestViewController.h"

@interface MMTestViewController ()

@property (nonatomic, strong) NSArray *countriesArray;
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
  
  _countriesArray = @[@"Australia (AUD)", @"China (CNY)", @"France (EUR)",
                              @"Great Britain (GBP)", @"Japan (JPY)", @"Iran (IR)", @"Sweden (SWE)", @"Swizerland (SW)",
                              @"Albania (AL)", @"Denmark (DK)"];
  
  _numbersArray = @[@12, @11, @123, @22, @5];
  
  _objectsArray = [NSArray arrayWithObjects: @"hej", @14, @13.3, @"glass", @1,  nil];
  
  _selectedObject = [_objectsArray objectAtIndex:0];
  
  _selectedString = [_countriesArray objectAtIndex:0];
  
  NSLog(@"%@",[_selectedObject description]);
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPickerViewButtonPressed:(id)sender {
  
  /*
   pickerViewBackgroundColor
   pickerViewTextColor
   toolbarBackgroundColor
   buttonColor
   font
   yValueFromTop
   selectedObject:_selectedString
  */
  
  
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_countriesArray
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
 
 
  
  /*
  [MMPickerView showPickerViewInView:self.view
                         withObjetcs:_objectsArray
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



/*
 -(void)logObjects:(NSArray *)objects
 withStringConverter:(NSString* (^)(id object))converter {
 
 for (id object in objects) {
 NSLog(@"%@", converter(object));
 }
 
 
 }
 
 -(void)myAwesomeMethod {
 
 NSArray *objects;
 
 [self logObjects:objects
 withStringConverter:^(id object) {
 
 return [object name];
 
 }];
 
 
 }
 */


  @end
