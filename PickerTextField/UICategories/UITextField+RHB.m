//
//  UITextField+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "UITextField+RHB.h"
#import "UIView+RHB.h"


@implementation UITextField(RHB)

-(instancetype)rhb_rightView:(UIView *)view rightViewMode:(UITextFieldViewMode)rightViewMode {
    
    self.rightViewMode = rightViewMode;
    self.rightView = view;
    return self;
}

@end
