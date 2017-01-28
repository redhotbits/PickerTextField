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
    
    if (self.enableBlock) {
        
        self.enableBlock(self, enabled);
    }
    [super setEnabled:enabled];
}

@end
