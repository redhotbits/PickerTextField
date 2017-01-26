//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "MultiArrayPickerView.h"
#import <BlocksKit/BlocksKit.h>
#import "MultiArrayTextField+RHB.h"


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
    
    MultiArrayPickerView *multiArrayPickerView = [MultiArrayPickerView new];
    multiArrayPickerView.multiArrayTextField = self;

    [self.selections enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [multiArrayPickerView selectRow:obj.integerValue inComponent:idx animated:NO];
    }];
    
    return multiArrayPickerView;
}

-(void)defaultSetupForViewingWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections {
    
    [self rhb_setupMirkoStyle];
    [self rhb_setupForViewingWithData:data selections:selections];
}


@end
