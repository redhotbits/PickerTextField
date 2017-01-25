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
#import "RHBTextFieldWithPickerProtocol.h"


@interface MultiArrayTextField()<RHBTextFieldWithPickerProtocol>

@property (nonatomic) UITapGestureRecognizer *dismissTapRecognizer;
@property (nonatomic) MultiArrayPickerView *multiArrayPickerView;
@property (nonatomic) NSMutableArray<NSNumber *> *internalSelections;

@end


@implementation MultiArrayTextField

-(NSArray<NSNumber *> *)selections {
    
    return _internalSelections;
}

-(void)setSelections:(NSArray<NSNumber *> *)selections {
    
    NSAssert(self.data, @"first set data");
    NSAssert(self.data.count == selections.count, @"need proper selections");
    _internalSelections = selections.mutableCopy;
    [selections enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.multiArrayPickerView selectRow:obj.integerValue inComponent:idx animated:NO];
    }];
    [self updateTextFromSelections];
}

-(void)updateTextFromSelections {
    
    NSArray<NSNumber *> *selections = self.selections;
    NSMutableArray<NSString *> *strings = [NSMutableArray arrayWithCapacity:selections.count];
    for(NSInteger i=0;i<selections.count;i++) {
        
        NSInteger selectedIndex = selections[i].integerValue;
        NSString *string = self.data[i][selectedIndex];
        [strings addObject:string];
    }
    self.text = [strings componentsJoinedByString:@" - "];
}

-(MultiArrayPickerView *)multiArrayPickerView {
    
    if (!_multiArrayPickerView) {
        
        _multiArrayPickerView = [MultiArrayPickerView new];
        [_multiArrayPickerView registerWithMultiArrayTextField:self];
        self.inputView = _multiArrayPickerView;
        self.delegate = [MultiArrayTextFieldDelegate sharedInstance];
    }
    return _multiArrayPickerView;
}

- (void)setData:(NSArray<NSArray *> *)data {
    
    NSLog(@"Setting Data to:%@", data);
    
    _data = data;
    [self.multiArrayPickerView reloadAllComponents];
    _internalSelections = [data bk_map:^id(id obj) {
        return @(0);
    }].mutableCopy;
    [self updateTextFromSelections];
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
