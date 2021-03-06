//
//  PickerTextField.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import "PickerTextField.h"

@implementation PickerTextField

#define INDICATOR_ARROW @"▼  ";
#define BASE_COLOR [UIColor colorWithRed:0.345 green:0.302 blue:0.239 alpha:1.000]

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
    
    self.picker = [[GenericPicker alloc] initWithData:self.data andCompletionHandler:^(NSString *selectedString, int selectedRow) {
        [self setSelectedText];
    }];
    
    self.inputView = self.picker.picker;
    
    [self setSelectedText];
}

- (void)setup{
    self.delegate = self;
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = BASE_COLOR;
    self.tintColor = [UIColor clearColor];
    [self addArrowIndicator];
}

- (BOOL)becomeFirstResponder{
    if(!self.dismissTapRecognizer){
        self.dismissTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPicker)];
    }

    [self.window.subviews.firstObject addGestureRecognizer:self.dismissTapRecognizer];
    return [super becomeFirstResponder];
}

- (void)dismissPicker{
    [self.window.subviews.firstObject removeGestureRecognizer:self.dismissTapRecognizer];
    [self resignFirstResponder];
}

- (void)addArrowIndicator{
    self.arrowLabel = [[UILabel alloc] init];
    self.arrowLabel.text = INDICATOR_ARROW;
    self.arrowLabel.textColor = BASE_COLOR;
    [self.arrowLabel sizeToFit];
    
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = self.arrowLabel;
}

- (void)setSelectedText{
    NSMutableArray* selected = [NSMutableArray array];
    
    for(int i=0;i<self.picker.data.count;i++){
        long selectedIndex = [self.picker.picker selectedRowInComponent:i];
        [selected addObject:self.picker.data[i][selectedIndex]];
    }
    
    self.text = [selected componentsJoinedByString:@" - "];
}

- (void)setEnabled:(BOOL)enabled{
    if(enabled){
        self.textColor = self.arrowLabel.textColor = BASE_COLOR;
    } else {
        self.textColor = self.arrowLabel.textColor = [UIColor lightGrayColor];
    }
    [super setEnabled:enabled];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.rightView.transform = CGAffineTransformMakeScale(1, -1);
        
        self.layer.cornerRadius=6.0f;
        self.layer.masksToBounds=YES;
        
        self.layer.borderColor= [BASE_COLOR CGColor];
        self.layer.borderWidth= 1.0f;
    } completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        self.rightView.transform=CGAffineTransformMakeRotation( 0 );
    } completion:nil];
    self.layer.borderColor=[[UIColor clearColor] CGColor];
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
