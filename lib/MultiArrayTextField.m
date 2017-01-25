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

@end


@implementation MultiArrayTextField

- (void)setData:(NSArray *)data {
    
    NSLog(@"Setting Data to:%@", data);
    
    _data = data;
    
    MultiArrayPickerView *pickerView = [MultiArrayPickerView new];
    [pickerView registerDelegatesWithData:self.data dataFont:[UIFont systemFontOfSize:16] selectionHandler:^(MultiArrayPickerView *pickerView) {

        [self setSelectedTextInPickerView:pickerView];
    }];
    [self setSelectedTextInPickerView:pickerView];
    self.inputView = pickerView;
    self.delegate = [MultiArrayTextFieldDelegate sharedInstance];
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

-(void)addRightFlipView:(UIView *)view {
    
    CGFloat height = self.frame.size.height;
    view.frame = (CGRect){CGPointZero, CGSizeMake(height, height)};
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = view;
}

- (void)setSelectedTextInPickerView:(UIPickerView *) pickerView {
    
    NSMutableArray* selected = [NSMutableArray array];
    for(NSInteger i=0;i<self.data.count;i++){
        NSInteger selectedIndex = [pickerView selectedRowInComponent:i];
        [selected addObject:self.data[i][selectedIndex]];
    }
    
    self.text = [selected componentsJoinedByString:@" - "];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

@end
