//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "PTFPickerView.h"
#import <BlocksKit/BlocksKit.h>
#import "PTFAbstractTextField.h"


@interface MultiArrayTextField()<PTFAbstractTextFieldPrivate>
@end


@implementation MultiArrayTextField

-(void)setData:(NSArray<NSArray *> *)data {
    
    _data = data;
    if (self.selections.count != data.count) {
        
        self.selections = [data bk_map:^id(id obj) {
            return @(0);
        }];
    }
}

-(NSString *)makeTextFromSelections {
    
    NSMutableArray<NSString *> *strings = [NSMutableArray arrayWithCapacity:self.selections.count];
    for(NSInteger i=0;i<self.selections.count;i++) {
        
        NSInteger selectedIndex = self.selections[i].integerValue;
        NSString *string = self.data[i][selectedIndex];
        [strings addObject:string];
    }
    return [strings componentsJoinedByString:@" - "];
}

-(UIPickerView *)makeInputPicker {
    
    return [[PTFPickerView alloc] initWithMultiArrayTextField:self];
}

-(void)setupWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections {
    
    self.data = data;
    self.selections = selections;
    self.text = [self makeTextFromSelections];
}

@end
