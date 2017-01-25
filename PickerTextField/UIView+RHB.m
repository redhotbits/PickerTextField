//
//  UIView+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/24/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "UIView+RHB.h"

@implementation UIView(RHB)

-(void)rhb_animateVerticalFlipUp:(BOOL)isFlipUp {
    
    UIViewAnimationOptions options = isFlipUp ? UIViewAnimationOptionTransitionCurlDown : UIViewAnimationOptionTransitionCurlUp;
    CGAffineTransform transform = isFlipUp ? CGAffineTransformIdentity : CGAffineTransformMakeScale(1, -1);
    [UIView animateWithDuration:0.3 delay:0 options:options animations:^{
        
        self.transform = transform;
    } completion:nil];
}

@end
