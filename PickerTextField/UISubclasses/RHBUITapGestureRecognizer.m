//
//  RHBTapGestureRecognizer.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBUITapGestureRecognizer.h"


@implementation RHBUITapGestureRecognizer

-(instancetype)init {
    
    return (self = [super initWithTarget:nil action:nil]);
}

-(void)tapExecutor {
    
    self.actionBlock(self);
}

-(void)setActionBlock:(ActionBlock)actionBlock {
    
    [self removeTarget:self action:@selector(tapExecutor)];
    if (actionBlock) {

        [self addTarget:self action:@selector(tapExecutor)];
    }
    _actionBlock = actionBlock;
}

-(void)dealloc {
    
    NSLog(@"dealloc in %@", [self class]);
    [self setActionBlock:nil];
}

@end
