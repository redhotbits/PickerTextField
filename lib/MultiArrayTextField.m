//
//  MultiArrayTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "MultiArrayTextField.h"
#import "MultiArrayPickerView.h"
#import "FlipRightViewTextFieldDelegate.h"


@interface MultiArrayTextField()

@property (nonatomic) UITapGestureRecognizer *dismissTapRecognizer;

@end


@implementation MultiArrayTextField

#define INDICATOR_ARROW_CHARACTER @"▼";

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

- (void)setData:(NSArray *)data {
    NSLog(@"Setting Data to:%@", data);
    
    _data = data;
    
    MultiArrayPickerView *pickerView = [MultiArrayPickerView new];
    [pickerView registerDelegatesWithData:self.data dataFont:[UIFont systemFontOfSize:16] selectionHandler:^(MultiArrayPickerView *pickerView) {

        [self setSelectedTextInPickerView:pickerView];
    }];
    [self setSelectedTextInPickerView:pickerView];
    self.inputView = pickerView;
}

- (void)setup{
    self.delegate = [FlipRightViewTextFieldDelegate sharedInstance];
    self.textAlignment = NSTextAlignmentCenter;
    self.tintColor = [UIColor clearColor];
    [self addArrowIndicator];
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

- (void)addArrowIndicator{
    self.arrowLabel = [[UILabel alloc] init];
    self.arrowLabel.text = INDICATOR_ARROW_CHARACTER;
    self.arrowLabel.textAlignment = NSTextAlignmentCenter;
    [self.arrowLabel sizeToFit];
    
    CGRect arrowFrame = self.arrowLabel.frame;
    arrowFrame.size.width = arrowFrame.size.width + (self.arrowLabel.layoutMargins.left + self.arrowLabel.layoutMargins.right);
    self.arrowLabel.frame = arrowFrame;
    
    
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = self.arrowLabel;
}

- (void)setSelectedTextInPickerView:(UIPickerView *) pickerView {
    
    NSMutableArray* selected = [NSMutableArray array];
    for(NSInteger i=0;i<self.data.count;i++){
        NSInteger selectedIndex = [pickerView selectedRowInComponent:i];
        [selected addObject:self.data[i][selectedIndex]];
    }
    
    self.text = [selected componentsJoinedByString:@" - "];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.arrowLabel.frame.size.width, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.arrowLabel.frame.size.width, 0);
}


@end
