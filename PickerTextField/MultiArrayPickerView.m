//
//  MultiArrayPickerView.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayPickerView.h"
#import "MultiArrayPickerDelegate.h"
#import "MultiArrayTextField.h"
#import "RHBTextFieldDelegate.h"


@implementation MultiArrayPickerView

-(instancetype)initWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField {

    if (self = [super initWithFrame:CGRectZero]) {
        
        _pickerTextField = multiArrayTextField;
        _pickerTextField.delegate = [RHBTextFieldDelegate sharedInstance];
        self.dataSource = [MultiArrayPickerDelegate sharedInstance];
        self.delegate = [MultiArrayPickerDelegate sharedInstance];
    }
    return self;
}

@end
