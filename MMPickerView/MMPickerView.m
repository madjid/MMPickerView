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

#pragma mark - Show Methods

+(void)showInView:(UIView *)view
        withArray:(NSArray *)array
       completion:(void (^)(NSString *))completion{
  
  [[self sharedView] initializePickerViewInView:view withArray:array withBackgroundColor:nil withTextColor:nil withToolbarBackgroundColor:nil withButtonColor:nil  withFont:nil withYValue:3.0];
  [[self sharedView] setPickerHidden:NO callBack:nil];
  [self sharedView].onDismissCompletion = completion;
  [view addSubview:[self sharedView]];

}

+(void)showWithCustomDesignInView: (UIView *)view
                        withArray: (NSArray *)array
              withBackgroundColor: (UIColor *)backgroundColor
                    withTextColor: (UIColor *)textColor
       withToolbarBackgroundColor: (UIColor *)toolbarBackgroundColor
                  withButtonColor: (UIColor *)buttonColor
                         withFont: (UIFont *)font
                       withYValue: (CGFloat)yValue
                       completion: (void (^)(NSString *))completion{
  
  [[self sharedView] initializePickerViewInView:view withArray:array withBackgroundColor:backgroundColor withTextColor: textColor withToolbarBackgroundColor: toolbarBackgroundColor withButtonColor:buttonColor withFont:font withYValue:yValue];
  [[self sharedView] setPickerHidden:NO callBack:nil];
  [self sharedView].onDismissCompletion = completion;
  [view addSubview:[self sharedView]];

}

+(void)showInView:(UIView *)view withArray:(NSArray *)array withObjectToStringConverter:(NSString *(^)(id))converter completion:(void (^)(id))completion {
  
  [[self sharedView] initializePickerViewInView:view withArray:array withBackgroundColor:nil withTextColor:nil withToolbarBackgroundColor:nil withButtonColor:nil withFont:nil withYValue:0];
  
  [self sharedView].objectToStringConverter = converter;
  [[self sharedView] setPickerHidden:NO callBack:nil];
  [self sharedView].onDismissCompletion = completion;
  [view addSubview:[self sharedView]];
  
}


#pragma mark - Dismiss Methods

+(void)dismissWithCompletion:(void (^)(NSString *))completion{
  [[self sharedView] setPickerHidden:YES callBack:completion];
}

-(void)dismiss{
 [MMPickerView dismissWithCompletion:self.onDismissCompletion];
}

+(void)removePickerView{
  [[self sharedView] removeFromSuperview];
}

#pragma mark - Show/hide PickerView

-(void)setPickerHidden: (BOOL)hidden callBack: (void(^)(NSString *))callBack; {
  
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

                     if(completed && hidden){
                       [MMPickerView removePickerView];
                       //callBack(_pickerViewChosenString);
                     
                       callBack([[self selectedObject] description]);
                     }
                   }];

}

#pragma mark - Initialize PickerView

-(void)initializePickerViewInView: (UIView *)view
                        withArray: (NSArray *)array
              withBackgroundColor: (UIColor *)pickerViewBackgroundColor
                    withTextColor: (UIColor *)pickerViewTextColor
       withToolbarBackgroundColor: (UIColor *)toolbarBackgroundColor
                  withButtonColor: (UIColor *)buttonColor
                         withFont: (UIFont *)font
                       withYValue: (CGFloat )yValueFromTop{
  
  _pickerViewArray = array;
  _yValueFromTop = yValueFromTop;
  
  [self setFrame: view.bounds];
  [self setBackgroundColor:[UIColor clearColor]];
  
  //Whole screen with PickerView and a dimmed background
  _pickerViewContainerView = [[UIView alloc] initWithFrame:view.bounds];
  [_pickerViewContainerView setBackgroundColor: [UIColor colorWithRed:0.412 green:0.412 blue:0.412 alpha:0.7]];
  [self addSubview:_pickerViewContainerView];
  
  //PickerView Container with top bar
  _pickerContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, _pickerViewContainerView.bounds.size.height - 260.0, 320.0, 260.0)];
  
  
  //Default Color Values (if colors == nil)
  
  //PickerViewBackgroundColor - White
  if (pickerViewBackgroundColor==nil) {
    pickerViewBackgroundColor = [UIColor whiteColor];
  }
 
  //PickerViewTextColor - Black
  if (pickerViewTextColor==nil) {
    pickerViewTextColor = [UIColor blackColor];
  }
    _pickerViewTextColor = pickerViewTextColor;
  
  //ToolbarBackgroundColor - Black
  if (toolbarBackgroundColor==nil) {
    toolbarBackgroundColor = [UIColor colorWithRed:0.969 green:0.969 blue:0.969 alpha:0.8];
  }
  
  //ButtonTextColor - Blue
  if (buttonColor==nil) {
    buttonColor = [UIColor colorWithRed:0.000 green:0.486 blue:0.976 alpha:1];
  }
  
  if (font==nil) {
    _pickerViewFont = [UIFont systemFontOfSize:22];
  }
  _pickerViewFont = font;
  
  /*
  //ToolbackBackgroundImage - Clear Color
  if (toolbarBackgroundImage!=nil) {
    //Top bar imageView
    _pickerTopBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, _pickerContainerView.frame.size.width, 44.0)];
     //[_pickerContainerView addSubview:_pickerTopBarImageView];
    _pickerTopBarImageView.image = toolbarBackgroundImage;
    [_pickerViewToolBar setHidden:YES];
  
  }
*/
   
  _pickerContainerView.backgroundColor = pickerViewBackgroundColor;
  [_pickerViewContainerView addSubview:_pickerContainerView];
  

  //Content of pickerContainerView
  
  //Top bar view
  _pickerTopBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, _pickerContainerView.frame.size.width, 44.0)];
  [_pickerContainerView addSubview:_pickerTopBarView];
  [_pickerTopBarView setBackgroundColor:[UIColor blackColor]];
  
  
  _pickerViewToolBar = [[UIToolbar alloc] initWithFrame:_pickerTopBarView.frame];
  [_pickerContainerView addSubview:_pickerViewToolBar];
  //[_pickerViewToolBar setBackgroundColor:toolbarBackgroundColor];
  //_pickerViewToolBar.backgroundColor = [UIColor blackColor];
  //_pickerViewToolBar.barTintColor = toolbarBackgroundColor;

  
  CGFloat iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
  NSLog(@"%f",iOSVersion);
  
  if (iOSVersion < 7.0) {
    _pickerViewToolBar.tintColor = toolbarBackgroundColor;
   // [_pickerViewToolBar setBackgroundColor:toolbarBackgroundColor];
  }else{
   // _pickerViewToolBar.tintColor = toolbarBackgroundColor;
    _pickerViewToolBar.barTintColor = toolbarBackgroundColor;
  }
  
  UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
  
  _pickerViewBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss)];
  _pickerViewToolBar.items = @[flexibleSpace, _pickerViewBarButtonItem];
  [[UIBarButtonItem appearance] setTintColor:buttonColor];
  
  //[_pickerViewBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Helvetica-Neue" size:23.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
  /*
  _pickerDoneButton = [[UIButton alloc] initWithFrame:CGRectMake(_pickerContainerView.frame.size.width - 80.0, 10.0, 60.0, 24.0)];
  [_pickerDoneButton setTitle:@"Done" forState:UIControlStateNormal];
  [_pickerContainerView addSubview:_pickerDoneButton];
  [_pickerDoneButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
   */
  
  //Add pickerView
  _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 320.0, 216.0)];
  [_pickerView setDelegate:self];
  [_pickerView setDataSource:self];
  [_pickerView setShowsSelectionIndicator:YES];
  [_pickerContainerView addSubview:_pickerView];
  
  //[self.pickerViewContainerView setAlpha:0.0];
  [_pickerContainerView setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(_pickerContainerView.frame))];

  //[_pickerView selectRow:_previouslySelectedRow inComponent:0 animated:YES];
}


- (id)selectedObject {
  return [_pickerViewArray objectAtIndex: [self.pickerView selectedRowInComponent:0]];
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
//  return [_pickerViewArray objectAtIndex:row];

  
//  if ([self selectedObject]==nil) {
//    return [_pickerViewArray objectAtIndex:row];
//  } else{
    return (self.objectToStringConverter ([_pickerViewArray objectAtIndex:row]));
//  }
  
//  return (self.objectToStringConverter ([_pickerViewArray objectAtIndex:row]));
}


#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  //_pickerViewChosenString = [_pickerViewArray objectAtIndex:row];
  //self.onDismissCompletion (_pickerViewChosenString);
  
  _previouslySelectedRow = row;

  if (self.objectToStringConverter == nil) {
    self.onDismissCompletion ([_pickerViewArray objectAtIndex:row]);
  } else{
    self.onDismissCompletion (self.objectToStringConverter ([self selectedObject]));
  }
}


- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
  
  UIView *customPickerView = view;
  
  UILabel *pickerViewLabel;
  
  if (customPickerView==nil) {
    
    CGRect frame = CGRectMake(0.0, 0.0, 292.0, 44.0);
    customPickerView = [[UIView alloc] initWithFrame: frame];
    
  //  UIImageView *patternImageView = [[UIImageView alloc] initWithFrame:frame];
 //   patternImageView.image = [[UIImage imageNamed:@"texture"] resizableImageWithCapInsets:UIEdgeInsetsZero];
//    [customPickerView addSubview:patternImageView];
    
    
    if (_yValueFromTop == 0.0f) {
      _yValueFromTop = 3.0;
    }
     
    
    CGRect labelFrame = CGRectMake(0.0, _yValueFromTop, 292.0, 35.0);
    pickerViewLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [pickerViewLabel setTag:1];
    [pickerViewLabel setTextAlignment:NSTextAlignmentCenter];
    [pickerViewLabel setBackgroundColor:[UIColor clearColor]];
    [pickerViewLabel setTextColor:_pickerViewTextColor];
    [pickerViewLabel setFont:_pickerViewFont];
     
   // [countryNameLabel setFont:[FifaTheme condensedBigFont]];
   // [countryNameLabel setTextColor:[FifaTheme budwiserBlueColor]];
    [customPickerView addSubview:pickerViewLabel];
  } else{
    
    for (UIView *view in customPickerView.subviews) {
      if (view.tag == 1) {
        pickerViewLabel = (UILabel *)view;
        break;
      }
    }
    
  }
  
 // [pickerViewLabel setText: [_pickerViewArray objectAtIndex:row]];
  
  if (self.objectToStringConverter == nil){
    [pickerViewLabel setText: [_pickerViewArray objectAtIndex:row]];
  } else{
  
  [pickerViewLabel setText:(self.objectToStringConverter ([_pickerViewArray objectAtIndex:row]))];
  }
  
  return customPickerView;

}


@end
