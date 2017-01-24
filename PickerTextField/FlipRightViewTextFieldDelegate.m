//
//  FlipRightViewTextFieldDelegate.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "FlipRightViewTextFieldDelegate.h"
#import "UIView+RHB.h"

@implementation FlipRightViewTextFieldDelegate

RHB_SINGLETON_IMPLEMENTATION();

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateFlipUp:NO];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateFlipUp:YES];
}

@end
