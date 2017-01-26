//
//  RHBTextFieldPickerView.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBTextFieldPickerView.h"
#import "MultiArrayPickerDelegate.h"
#import "MultiArrayTextField.h"
#import "RHBTextFieldDelegate.h"
#import "UIView+RHB.h"


@implementation RHBTextFieldPickerView

-(instancetype)initWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField {

    if (self = [super initWithFrame:CGRectZero]) {
        
        _pickerTextField = multiArrayTextField;
        [_pickerTextField rhb_addAutomaticResignRecognizer];
        _pickerTextField.delegate = [RHBTextFieldDelegate sharedInstance];
        self.dataSource = [MultiArrayPickerDelegate sharedInstance];
        self.delegate = [MultiArrayPickerDelegate sharedInstance];
    }
    return self;
}

@end
