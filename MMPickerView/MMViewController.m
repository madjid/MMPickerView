//
//  MMViewController.m
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/5/13.
//  Copyright (c) 2013 GG. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()
- (IBAction)pickerViewDoneButtonPressed:(id)sender;
- (IBAction)pickerViewButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *pickerViewView;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;
@property (weak, nonatomic) IBOutlet UIButton *pickerViewDoneButton;
@property (weak, nonatomic) IBOutlet UIImageView *pickerViewTopImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@property (strong, nonatomic) NSArray *countryNames;

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

  self.countryNames = @[@"Australia (AUD)", @"China (CNY)", @"France (EUR)",
                        @"Great Britain (GBP)", @"Japan (JPY)"];
  
  [self.pickerViewView setAlpha:0.0];
  [self.pickerViewView setFrame:self.view.bounds];
  [self.pickerViewContainer setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.pickerViewContainer.frame))];
  [self.view addSubview:self.pickerViewView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Picker

- (IBAction)pickerViewDoneButtonPressed:(id)sender {
  [self setPickerHidden:YES];
}

- (IBAction)pickerViewButtonPressed:(id)sender {
  [self setPickerHidden:NO];
  
}

-(void)setPickerHidden:(BOOL)hidden {
  
  [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                   animations:^{
                     
                     if (hidden) {
                       
                       [self.pickerViewView setAlpha:0.0];
                       [self.pickerViewContainer setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.pickerViewContainer.frame))];
                       
                     } else {
                       
                       [self.pickerViewView setAlpha:1.0];
                       [self.pickerViewContainer setTransform:CGAffineTransformIdentity];
                       
                     }
                     
                   } completion:^(BOOL completed) {
                     
                   }];
  
}




#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
  return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
  return [_countryNames count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
  return [_countryNames objectAtIndex:row];
}


#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  _countryLabel.text = [self.countryNames objectAtIndex:row];

}


- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
  
  UIView *customPickerView = view;
  
  UILabel *countryNameLabel;
  
  if (customPickerView==nil) {
    
    CGRect frame = CGRectMake(0.0, 0.0, 292.0, 44.0);
    customPickerView = [[UIView alloc] initWithFrame: frame];
    
    /*
    UIImageView *patternImageView = [[UIImageView alloc] initWithFrame:frame];
    patternImageView.image = [[UIImage imageNamed:@"texture"] resizableImageWithCapInsets:UIEdgeInsetsZero];
    [customPickerView addSubview:patternImageView];
    */
    CGRect labelFrame = CGRectMake(0.0, 6.0, 292.0, 35.0);
    countryNameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [countryNameLabel setTag:1];
    [countryNameLabel setTextAlignment:NSTextAlignmentCenter];
    [countryNameLabel setBackgroundColor:[UIColor clearColor]];
   // [countryNameLabel setFont:[FifaTheme condensedBigFont]];
   // [countryNameLabel setTextColor:[FifaTheme budwiserBlueColor]];
    [customPickerView addSubview:countryNameLabel];
  } else{
    
    for (UIView *view in customPickerView.subviews) {
      if (view.tag == 1) {
        countryNameLabel = (UILabel *)view;
        break;
      }
    }
    
  }
  
  [countryNameLabel setText: [[self.countryNames objectAtIndex:row] uppercaseString]];
  
  return customPickerView;
  
}





@end
