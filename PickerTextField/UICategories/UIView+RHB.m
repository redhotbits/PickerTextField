//
//  UIView+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/24/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "UIView+RHB.h"
#import "RHBUITapGestureRecognizer.h"


@implementation UIView(RHB)

-(void)rhb_animateVerticalFlipUp:(BOOL)isFlipUp {
    
    UIViewAnimationOptions options = isFlipUp ? UIViewAnimationOptionTransitionCurlDown : UIViewAnimationOptionTransitionCurlUp;
    CGAffineTransform transform = isFlipUp ? CGAffineTransformIdentity : CGAffineTransformMakeScale(1, -1);
    [UIView animateWithDuration:0.3 delay:0 options:options animations:^{
        
        self.transform = transform;
    } completion:nil];
}

-(CGSize)rhb_squareHeightSize {
    
    CGFloat h = self.frame.size.height;
    return CGSizeMake(h, h);
}

-(UITapGestureRecognizer *)rhb_resignRecognizer {
    
    RHBUITapGestureRecognizer *tap = [RHBUITapGestureRecognizer new];
    __weak typeof(self) weakSelf = self;
    tap.actionBlock = ^(RHBUITapGestureRecognizer *recognizer){
        
        [weakSelf resignFirstResponder];
    };
    return tap;
}

-(instancetype)rhb_frame:(CGRect)frame {

    self.frame = frame;
    return self;
}

@end
