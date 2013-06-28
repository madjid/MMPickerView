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
                         @"Great Britain (GBP)", @"Japan (JPY)"];
/*
  [MMPickerView showInView:self.view withArray:countriesArray withBackgroundColor:[UIColor blackColor] completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
*/
  /*
  [MMPickerView showWithCustomDesignInView:self.view withArray:countriesArray withBackgroundColor:[UIColor orangeColor] withTextColor:[UIColor brownColor] withToolbarBackgroundColor:[UIColor grayColor] withButtonTextColor:[UIColor blackColor] withButtonBackgroundColor:[UIColor blackColor] completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
  */
  
  [MMPickerView showWithCustomDesignInView:self.view withArray:countriesArray withBackgroundColor:nil withTextColor:nil withToolbarBackgroundColor:nil withButtonTextColor:nil withButtonBackgroundColor:nil withFont:[UIFont fontWithName:@"Helvetica-Bold" size:26.0] completion:^(NSString *pickerLabelString) {
    _label.text = pickerLabelString;
  }];
  
  
}
@end
