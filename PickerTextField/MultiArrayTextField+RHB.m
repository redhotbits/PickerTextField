//
//  MultiArrayTextField+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayTextField+RHB.h"


@implementation MultiArrayTextField(RHB)

-(void)rhb_addRightFlipArrow {
    
    UILabel *arrow = [UILabel new];
    arrow.text = @"▼";
    arrow.textAlignment = NSTextAlignmentCenter;
    [self addRightFlipView:arrow];
}

@end
