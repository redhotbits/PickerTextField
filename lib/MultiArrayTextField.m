//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "MultiArrayPickerView.h"
#import "MultiArrayTextFieldDelegate.h"
#import <BlocksKit/BlocksKit.h>


@interface MultiArrayTextField()

@property (nonatomic) UITapGestureRecognizer *dismissTapRecognizer;

@end


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
    
    NSArray<NSNumber *> *selections = self.selections;
    NSArray<NSArray *> *data = self.data;
    NSMutableArray<NSString *> *strings = [NSMutableArray arrayWithCapacity:selections.count];
    for(NSInteger i=0;i<selections.count;i++) {
        
        NSInteger selectedIndex = selections[i].integerValue;
        NSString *string = data[i][selectedIndex];
        [strings addObject:string];
    }
    self.text = [strings componentsJoinedByString:@" - "];
}

-(UIView *)inputView {
    
    MultiArrayPickerView *multiArrayPickerView = [MultiArrayPickerView new];
    multiArrayPickerView.multiArrayTextField = self;
    self.delegate = [MultiArrayTextFieldDelegate sharedInstance];

    [_selections enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [multiArrayPickerView selectRow:obj.integerValue inComponent:idx animated:NO];
    }];
    
    return multiArrayPickerView;
}

-(UITapGestureRecognizer *)dismissTapRecognizer {
    
    if (!_dismissTapRecognizer) {
        
        _dismissTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPicker)];
    }
    return _dismissTapRecognizer;
}

- (BOOL)becomeFirstResponder {
    
    [self.window.subviews.firstObject addGestureRecognizer:self.dismissTapRecognizer];
    return [super becomeFirstResponder];
}

- (void)dismissPicker {
    
    [self.window.subviews.firstObject removeGestureRecognizer:self.dismissTapRecognizer];
    [self resignFirstResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

@end
