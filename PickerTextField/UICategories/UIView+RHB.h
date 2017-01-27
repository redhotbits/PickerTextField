//
//  UIView+RHB.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/24/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView(RHB)

-(void)rhb_animateVerticalFlipUp:(BOOL)isFlipUp;

@property (nonatomic, readonly) CGSize rhb_squareHeightSize;

-(UITapGestureRecognizer *)rhb_resignRecognizer;

@end
