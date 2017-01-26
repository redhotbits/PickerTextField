//
//  UILabel+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "UILabel+RHB.h"

@implementation UILabel(RHB)

+(instancetype)rhb_arrowDown {
    
    UILabel *arrow = [UILabel new];
    arrow.text = @"▼";
    arrow.textAlignment = NSTextAlignmentCenter;
    return arrow;
}

@end
