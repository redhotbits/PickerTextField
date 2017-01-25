//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "MultiArrayPickerView.h"
#import "RHBTextFieldDelegate.h"
#import <BlocksKit/BlocksKit.h>
#import "UIView+RHB.h"


@implementation MultiArrayTextField

-(void)setData:(NSArray<NSArray *> *)data {
    
    _data = data;
    if (_selections.count != data.count) {
        
        _selections = [data bk_map:^id(id obj) {
            return @(0);
        }];
    }
}

-(void)updateTextFromSelections {
    
    NSMutableArray<NSString *> *strings = [NSMutableArray arrayWithCapacity:_selections.count];
    for(NSInteger i=0;i<_selections.count;i++) {
        
        NSInteger selectedIndex = _selections[i].integerValue;
        NSString *string = _data[i][selectedIndex];
        [strings addObject:string];
    }
    self.text = [strings componentsJoinedByString:@" - "];
}

-(UIView *)makeInputView {
    
    MultiArrayPickerView *multiArrayPickerView = [MultiArrayPickerView new];
    multiArrayPickerView.multiArrayTextField = self;

    [_selections enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [multiArrayPickerView selectRow:obj.integerValue inComponent:idx animated:NO];
    }];
    
    return multiArrayPickerView;
}

-(BOOL)resignFirstResponder {
    
    self.inputView = nil;
    return [super resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    
    self.inputView = [self makeInputView];
    [self rhb_addAutomaticResignRecognizer];
    return [super becomeFirstResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

@end
