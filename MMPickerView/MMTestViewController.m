//
//  MMTestViewController.m
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/7/13.
//  Copyright (c) 2013 GG. All rights reserved.
//


#import "MMTestViewController.h"

@interface MMTestViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPickerViewButtonPressed:(id)sender {
 
  NSArray *countriesArray = @[@"Australia (AUD)", @"China (CNY)", @"France (EUR)",
                              @"Great Britain (GBP)", @"Japan (JPY)", @"Iran (IR)", @"Sweden (SWE)", @"Swizerland (SW)",
                              @"Albania (AL)", @"Denmark (DK)"];

  NSArray *numbersArray = @[@12, @11, @123, @22, @5];
 
  NSArray *objectArray = [NSArray arrayWithObjects: @"hej", @14, @13.3,  nil];
  
  /*
  [MMPickerView showInView:self.view withArray:countriesArray completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
  */
  
  /*
  [MMPickerView showWithCustomDesignInView:self.view
                                 withArray:countriesArray 
                       withBackgroundColor:[UIColor blackColor]
                             withTextColor:[UIColor whiteColor]
                withToolbarBackgroundColor:[UIColor blackColor]
                           withButtonColor:[UIColor grayColor]
                                  withFont:[UIFont fontWithName:@"Helvetiva-Neue" size:22.0]
                                withYValue:0
                                completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
  
*/
  
  /*
  [MMPickerView showInView:self.view withObjetcs:objectArray withObjectToStringConverter:^NSString *(id object) {
    
    return [object description];
    
  } completion:^(id chosenObject) {
    _label.text = [chosenObject description];
    
  }];
  */
  /*
   pickerViewBackgroundColor
   pickerViewTextColor
   toolbarBackgroundColor
   buttonColor
   font
   yValueFromTop
   
  */
  
  
  [MMPickerView showInView:self.view
               withStrings:countriesArray
         withDesignOptions:@{backgroundColor: [UIColor redColor],
                             textColor: [UIColor blueColor],
                             toolbarColor: [UIColor blackColor],
                             buttonColor : [UIColor blueColor],
                             font : [UIFont systemFontOfSize:18],
                             yValue:@3 }
                completion:^(NSString *pickerLabelString) {
                  _label.text = pickerLabelString;
                }];
  
  
  /*
  [MMPickerView showWithCustomDesignInView:self.view withArray:countriesArray withBackgroundColor:nil withTextColor:nil withToolbarBackgroundColor:nil withButtonColor:nil withFont:[UIFont fontWithName:@"Helvetica-Bold" size:22.0] withYValue:3.0 completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
  */
  
}
@end
