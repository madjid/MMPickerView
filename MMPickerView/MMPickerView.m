//
//  MMPickerView.m
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/5/13.
//  Copyright (c) 2013 GG. All rights reserved.
//

#import "MMPickerView.h"

@implementation MMPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (MMPickerView*)sharedView {
  static dispatch_once_t once;
  static MMPickerView *sharedView;
  dispatch_once(&once, ^ { sharedView = [[self alloc] init]; });
  return sharedView;
}

+(void)showInView:(UIView *)view
        withArray:(NSArray *)array{
  [[self sharedView] initializePickerViewInView:view withArray:array];
  [[self sharedView] setPickerHidden:NO];

  [view addSubview:[self sharedView]];
  
 // [[self sharedView] addSomething];
  
 // [view addSubview:[self sharedView]];
  
}

+(void)dismiss{
 // [[self sharedView] setPickerHidden:YES];
  [[self sharedView] initializePickerViewInView:nil withArray:nil];
}

+(void)dismissfromView{

  [[self sharedView] removeFromSuperview];
}

-(void)initializePickerViewInView: (UIView *)view
                        withArray: (NSArray *)array{
   _pickerViewArray = array;
  
  [self setFrame: view.bounds];
  [self setBackgroundColor:[UIColor clearColor]];
  
  //Whole screen with PickerView and a dimmed background
  _pickerViewContainerView = [[UIView alloc] initWithFrame:view.bounds];
  [_pickerViewContainerView setBackgroundColor:[UIColor colorWithWhite:0.687 alpha:0.5]];
  [self addSubview:_pickerViewContainerView];
  
  //PickerView Container with top bar
  _pickerContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, _pickerViewContainerView.bounds.size.height - 260.0, 320.0, 260.0)];
   _pickerContainerView.backgroundColor = [UIColor orangeColor];
  [_pickerViewContainerView addSubview:_pickerContainerView];
  
  
  //Content of pickerContainerView
  
  //Top bar view
  _pickerTopBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, _pickerContainerView.frame.size.width, 44.0)];
  [_pickerContainerView addSubview:_pickerTopBarView];
  [_pickerTopBarView setBackgroundColor:[UIColor greenColor]];
  
  _pickerDoneButton = [[UIButton alloc] initWithFrame:CGRectMake(_pickerContainerView.frame.size.width - 80.0, 10.0, 60.0, 24.0)];
  [_pickerDoneButton setTitle:@"Done" forState:UIControlStateNormal];
  [_pickerContainerView addSubview:_pickerDoneButton];
  [_pickerDoneButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
  
  /*
  //Top bar imageView
  _pickerTopBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, _pickerContainerView.frame.size.width, 44.0)];
  [_pickerContainerView addSubview:_pickerTopBarImageView];
  _pickerTopBarImageView.image =
   */
  
  //Add pickerView
  _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 320.0, 216.0)];
  [_pickerView setDelegate:self];
  [_pickerView setDataSource:self];
  [_pickerContainerView addSubview:_pickerView];

  [_pickerContainerView setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(_pickerContainerView.frame))];

}


-(void)dismiss{
  [self setPickerHidden:YES];
  //[MMPickerView showInView:nil withArray:nil];
 //[MMPickerView dismissfromView];
}


#pragma mark - Show/hide MMPickerView
-(void)setPickerHidden: (BOOL)hidden{
  
  [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                   animations:^{
                     
                     if (hidden) {
                       
                       [_pickerViewContainerView setAlpha:0.0];
                       [_pickerContainerView setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(_pickerContainerView.frame))];
                       
                     } else {
                       
                       [_pickerViewContainerView setAlpha:1.0];
                       [_pickerContainerView setTransform:CGAffineTransformIdentity];
                       
                     }
                     
                   } completion:^(BOOL completed) {

                   }];
  
}




#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
  return [_pickerViewArray count];
}

- (NSString *)pickerView: (UIPickerView *)pickerView
             titleForRow: (NSInteger)row
            forComponent: (NSInteger)component {
  return [_pickerViewArray objectAtIndex:row];
}


#pragma mark - UIPickerViewDelegate

/*
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  _countryLabel.text = [self.countryNames objectAtIndex:row];
  
}
*/


- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
  
  _pickerViewLabelView = view;
  
  if (_pickerViewLabelView==nil) {
    
    CGRect frame = CGRectMake(0.0, 0.0, 292.0, 44.0);
    [_pickerViewLabelView setFrame: frame];
    
    /*
     UIImageView *patternImageView = [[UIImageView alloc] initWithFrame:frame];
     patternImageView.image = [[UIImage imageNamed:@"texture"] resizableImageWithCapInsets:UIEdgeInsetsZero];
     [customPickerView addSubview:patternImageView];
     */
    
    CGRect labelFrame = CGRectMake(0.0, 6.0, 292.0, 35.0);
    [_pickerViewLabel setFrame:labelFrame];
    [_pickerViewLabel setTag:1];
    [_pickerViewLabel setTextAlignment:NSTextAlignmentCenter];
    [_pickerViewLabel setBackgroundColor:[UIColor clearColor]];
    //[_pickerViewLabel setFont:];
    [_pickerViewLabel setTextColor:[UIColor blackColor]];
    [_pickerViewLabelView addSubview:_pickerViewLabel];
  } else{
    
    for (UIView *view in _pickerViewLabelView.subviews) {
      if (view.tag == 1) {
        _pickerViewLabel = (UILabel *)view;
        break;
      }
    }
    
  }
  
  [_pickerViewLabel setText: [[_pickerViewArray objectAtIndex:row] uppercaseString]];
  
  return _pickerViewLabelView;
  
}





@end
