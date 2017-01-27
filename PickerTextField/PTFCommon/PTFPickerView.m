//
//  PTFPickerView.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFPickerView.h"
#import "MultiArrayPickerDelegate.h"
#import "MultiArrayTextField.h"
#import "PTFTextFieldDelegate.h"
#import "UIView+RHB.h"


@interface PTFPickerView()

@property (nonatomic) UITapGestureRecognizer *recognizer;

@end

@implementation PTFPickerView

-(instancetype)initWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField {

    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    if (self = [super initWithFrame:CGRectZero]) {
        
        _pickerTextField = multiArrayTextField;
        _recognizer = [_pickerTextField rhb_resignRecognizer];
        [UIApplication.sharedApplication.keyWindow.subviews.firstObject addGestureRecognizer:_recognizer];
        _pickerTextField.delegate = [PTFTextFieldDelegate sharedInstance];
        self.dataSource = [MultiArrayPickerDelegate sharedInstance];
        self.delegate = [MultiArrayPickerDelegate sharedInstance];
    }
    return self;
}

-(void)dealloc {
    
    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    [_recognizer.view removeGestureRecognizer:_recognizer];
}

@end
