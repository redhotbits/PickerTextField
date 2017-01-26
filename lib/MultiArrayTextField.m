//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "RHBTextFieldPickerView.h"
#import <BlocksKit/BlocksKit.h>
#import "MultiArrayTextField+RHB.h"


@interface MultiArrayTextField()<AbstractPickerTextFieldPrivate>
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
    
    return [[RHBTextFieldPickerView alloc] initWithMultiArrayTextField:self];
}

-(void)defaultSetupForViewingWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections {
    
    [self rhb_setupMirkoStyle];
    self.selections = selections;
    self.data = data;
    [self updateTextFromSelections];
}

@end
