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

-(void)rhb_addRightFlipView:(UIView *)view {
    
    view.frame = (CGRect){CGPointZero, self.rhb_squareHeightSize};
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = view;
}

@end
