//
//  PTFTextFieldDelegate.m
//  PTFTextFieldDelegate
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFTextFieldDelegate.h"
#import "UIView+RHB.h"


@implementation PTFTextFieldDelegate

RHB_SINGLETON_IMPLEMENTATION();

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateVerticalFlipUp:NO];
    textField.highlighted = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [textField.rightView rhb_animateVerticalFlipUp:YES];
    textField.highlighted = NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return NO;
}

@end
