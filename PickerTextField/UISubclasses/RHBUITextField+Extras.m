//
//  RHBUITextField+Extras.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/27/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBUITextField+Extras.h"


@implementation RHBUITextField(Extras)

-(instancetype)rhb_enabledBlockWithTransparency:(CGFloat)transparency {
    
    self.enableBlock = ^(RHBUITextField *field, BOOL flag) {
        
        field.alpha = flag ? 1 : (CGFloat)transparency;
    };
    return self;
}

@end
