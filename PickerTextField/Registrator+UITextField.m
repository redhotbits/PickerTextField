//
//  Registrator+UITextField.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "Registrator+UITextField.h"


@implementation Registrator(UITextField)


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        textField.rightView.transform = CGAffineTransformMakeScale(1, -1);
        
        textField.layer.cornerRadius=6.0f;
        textField.layer.masksToBounds=YES;
        
        textField.layer.borderColor= textField.tintColor.CGColor;
        textField.layer.borderWidth= 1.0f;
    } completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        textField.rightView.transform=CGAffineTransformMakeRotation( 0 );
    } completion:nil];
    textField.layer.borderColor=[UIColor clearColor].CGColor;
}

@end
