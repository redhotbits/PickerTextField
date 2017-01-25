//
//  RHBTapGestureRecognizer.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBTapGestureRecognizer.h"


@interface RHBTapGestureRecognizer()

@property (nonatomic) ActionBlock actionBlock;

@end


@implementation RHBTapGestureRecognizer

-(instancetype)initWithBlock:(ActionBlock)actionBlock {
    
    if (self = [super initWithTarget:self action:@selector(tapExecutor)]) {
        
        _actionBlock = actionBlock;
    }
    return self;
}

-(void)tapExecutor {
    
    self.actionBlock(self);
}

-(void)dealloc {
    
    [self removeTarget:self action:@selector(tapExecutor)];
    _actionBlock = nil;
}

@end
