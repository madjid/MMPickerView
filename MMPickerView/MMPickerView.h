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
@property (nonatomic, strong) UIView *pickerContainerView; //Container for endast picker
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *pickerViewContainerView; // Container for hela
@property (nonatomic, strong) UIView *pickerTopBarView;
@property (nonatomic, strong) UIImageView *pickerTopBarImageView;
@property (nonatomic, strong) UIButton *pickerDoneButton;
@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *pickerViewArray;



+(void)showInView: (UIView *)view
        withArray: (NSArray *)array;

+(void)dismiss;

+(void)removeFromView: (UIView *)view;

@end
