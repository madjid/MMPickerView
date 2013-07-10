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
   
   MMbackgroundColor - UIColor
   MMtextColor - UIColor
   MMtoolbarColor - UIColor
   MMbuttonColor - UIColor
   MMfont - UIFont 
   MMvalueY - NSInteger
   MMselectedObject - An Object ex: a string
   MMtoolbarBackgroundImage  - UIImage
   */
 
  
  /*
   NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:nil
                          completion:^(NSString *selectedString) {
                            //selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
                          }];
  */
  
  NSArray *strings = @[@"This", @"is", @"just", @"an array", @"of strings."];
  UIFont *customFont  = [UIFont fontWithName:@"Palatino-Bold" size:19.0];
  NSDictionary *options = @{MMbackgroundColor: [UIColor colorWithHue:0.091 saturation:0.177 brightness:0.973 alpha:1],
                            MMtextColor: [UIColor colorWithRed:0.161 green:0.251 blue:0.322 alpha:1],
                            MMtoolbarColor: [UIColor colorWithRed:0.267 green:0.447 blue:0.580 alpha:1],
                            MMbuttonColor: [UIColor colorWithRed:0.561 green:0.737 blue:0.859 alpha:1],
                            MMfont: customFont,
                            MMvalueY: @5};
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:strings
                         withOptions:options
                          completion:^(NSString *selectedString) {
                            //selectedString is the return value which you can use as you wish
                            self.label.text = selectedString;
                          }];
  
  
  
   
}




@end
