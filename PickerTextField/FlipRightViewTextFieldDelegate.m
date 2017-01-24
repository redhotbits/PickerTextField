//
//  FlipRightViewTextFieldDelegate.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "FlipRightViewTextFieldDelegate.h"


@implementation FlipRightViewTextFieldDelegate

RHB_SINGLETON_IMPLEMENTATION();

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
        textField.rightView.transform = CGAffineTransformMakeScale(1, -1);
    } completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        
        textField.rightView.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
