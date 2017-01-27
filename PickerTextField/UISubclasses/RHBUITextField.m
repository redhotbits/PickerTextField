//
//  TextFieldWithBlocks.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/24/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBUITextField.h"


@implementation RHBUITextField

-(void)setEnabled:(BOOL)enabled {
    
    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    if (self.enableBlock) {
        
        self.enableBlock(self, enabled);
    }
    [super setEnabled:enabled];
}

-(void)setHighlighted:(BOOL)highlighted {
    
    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    if (self.highligtedBlock) {
        
        self.highligtedBlock(self, highlighted);
    }
    [super setHighlighted:highlighted];
}

@end
