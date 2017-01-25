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


@interface MultiArrayTextField()

@property (nonatomic) UITapGestureRecognizer *dismissTapRecognizer;
@property (nonatomic) MultiArrayPickerView *multiArrayPickerView;

@end


@implementation MultiArrayTextField

-(MultiArrayPickerView *)multiArrayPickerView {
    
    if (!_multiArrayPickerView) {
        
        _multiArrayPickerView = [MultiArrayPickerView new];
        [_multiArrayPickerView registerWithMultiArrayTextField:self];
        self.inputView = _multiArrayPickerView;
        self.delegate = [MultiArrayTextFieldDelegate sharedInstance];
    }
    return _multiArrayPickerView;
}

- (void)setData:(NSArray *)data {
    
    NSLog(@"Setting Data to:%@", data);
    
    _data = data;
    [self.multiArrayPickerView reloadAllComponents];
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
