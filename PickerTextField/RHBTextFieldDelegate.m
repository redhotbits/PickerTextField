//
//  RHBTextFieldDelegate.m
//  RHBTextFieldDelegate
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBTextFieldDelegate.h"
#import "UIView+RHB.h"


@implementation RHBTextFieldDelegate

RHB_SINGLETON_IMPLEMENTATION();

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateVerticalFlipUp:NO];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateVerticalFlipUp:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return NO;
}

@end
