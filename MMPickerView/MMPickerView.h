//
//  MMPickerView.h
//  MMPickerView
//
//  Created by Madjid Mahdjoubi on 6/5/13.
//  Copyright (c) 2013 GG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MMPickerView : UIView  <UIPickerViewDelegate, UIPickerViewDataSource>

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
@property (nonatomic, strong) NSString *pickerViewChosenString;

@property (nonatomic, strong) UIColor *pickerViewTextColor;
@property (nonatomic, strong) UIFont *pickerViewFont;

@property (copy) void (^onDismissCompletion)(NSString *);

+(void)showInView: (UIView *)view
        withArray: (NSArray *)array
       completion: (void(^)(NSString *pickerLabelString))completion;

+(void)dismissWithCompletion: (void(^)(NSString *))completion;

//+(UIFont *)setFont: (UIFont *)font withSize(float);

+(void)showInView: (UIView *)view
        withArray: (NSArray *)array
        withBackgroundColor:(UIColor *)backgroundColor
       completion: (void(^)(NSString *pickerLabelString))completion;

+(void)showWithCustomDesignInView: (UIView *)view
                        withArray: (NSArray *)array
              withBackgroundColor: (UIColor *)backgroundColor
                    withTextColor: (UIColor *)textColor
       withToolbarBackgroundColor: (UIColor *)toolbarBackgroundColor
              withButtonTextColor: (UIColor *)buttonTextColor
        withButtonBackgroundColor: (UIColor *)buttonBackgroundColor
                         withFont: (UIFont *)font
                       completion: (void(^)(NSString *pickerLabelString))completion;



@end
