//
//  MMPickerView.h
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/5/13.
//  Copyright (c) 2013 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const backgroundColor;
extern NSString * const textColor;
extern NSString * const toolbarColor;
extern NSString * const buttonColor;
extern NSString * const font;
extern NSString * const yValue;

@interface MMPickerView: UIView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UILabel *pickerViewLabel;
@property (nonatomic, strong) UIView *pickerViewLabelView;
@property (nonatomic, strong) UIView *pickerContainerView; 
@property (nonatomic, strong) UIView *pickerViewContainerView; 
@property (nonatomic, strong) UIView *pickerTopBarView;
@property (nonatomic, strong) UIImageView *pickerTopBarImageView;
@property (nonatomic, strong) UIToolbar *pickerViewToolBar;
@property (nonatomic, strong) UIBarButtonItem *pickerViewBarButtonItem;
@property (nonatomic, strong) UIButton *pickerDoneButton;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *pickerViewArray;
@property (nonatomic, strong) UIColor *pickerViewTextColor;
@property (nonatomic, strong) UIFont *pickerViewFont;
@property (nonatomic, assign) CGFloat yValueFromTop;
@property (nonatomic, assign) NSInteger previouslySelectedRow;

@property (copy) void (^onDismissCompletion)(NSString *);
@property (copy) NSString *(^objectToStringConverter)(id object);


+(void)showInView: (UIView *)view
      withStrings: (NSArray *)strings
       completion: (void(^)(NSString *pickerLabelString))completion;

+(void)dismissWithCompletion: (void(^)(NSString *))completion;


+(void)showWithCustomDesignInView: (UIView *)view
                      withStrings: (NSArray *)strings
              withBackgroundColor: (UIColor *)backgroundColor
                    withTextColor: (UIColor *)textColor
       withToolbarBackgroundColor: (UIColor *)toolbarBackgroundColor
                  withButtonColor: (UIColor *)buttonColor
                         withFont: (UIFont *)font
                       withYValue: (CGFloat )yValue
                       completion: (void(^)(NSString *pickerLabelString))completion;

//       withToolbarBackgroundImage: (UIImage *)toolbarBackgroundImage


+(void)showInView: (UIView *)view
      withObjetcs: (NSArray *)objects
 withObjectToStringConverter: (NSString *(^)(id object))converter
       completion: (void(^)(id chosenObject))completion;

+(void)showWithCustomDesignInView: (UIView *)view
                      withObjects: (NSArray *)objects
              withBackgroundColor: (UIColor *)backgroundColor
                    withTextColor: (UIColor *)textColor
       withToolbarBackgroundColor: (UIColor *)toolbarBackgroundColor
                  withButtonColor: (UIColor *)buttonColor
                         withFont: (UIFont *)font
                       withYValue: (CGFloat )yValue
      withObjectToStringConverter: (NSString *(^)(id object))converter
                       completion: (void(^)(id chosenObject))completion;


+(void)showInView: (UIView *)view
      withStrings: (NSArray *)strings
withDesignOptions: (NSDictionary *)options
       completion: (void(^)(NSString *pickerLabelString))completion;

+(void)showInView: (UIView *)view
      withObjetcs: (NSArray *)objects
withDesignOptions: (NSDictionary *)options
withObjectToStringConverter: (NSString *(^)(id object))converter
       completion: (void(^)(id chosenObject))completion;



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
