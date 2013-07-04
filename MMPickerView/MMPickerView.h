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
extern NSString * const selectedObject;

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

@property (copy) void (^onDismissCompletion)(NSString *);
@property (copy) NSString *(^objectToStringConverter)(id object);

+(void)showPickerViewInView: (UIView *)view
                withStrings: (NSArray *)strings
                withOptions: (NSDictionary *)options
                 completion: (void(^)(NSString *selectedString))completion;

+(void)showPickerViewInView: (UIView *)view
                withObjetcs: (NSArray *)objects
                withOptions: (NSDictionary *)options
    objectToStringConverter: (NSString *(^)(id object))converter
       completion: (void(^)(id selectedObject))completion;

+(void)dismissWithCompletion: (void(^)(NSString *))completion;

@end
