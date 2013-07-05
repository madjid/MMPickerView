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

@interface MMPickerView: UIView 

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
