//
//  PTFAbstractTextField.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFAbstractTextField.h"


@interface PTFAbstractTextField()<PTFAbstractTextFieldPrivate>
@end


@implementation PTFAbstractTextField

-(BOOL)resignFirstResponder {
    
    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    self.inputView = nil;
    return [super resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    
    NSLog(@"%@%@", [self class], @(__PRETTY_FUNCTION__));
    UIPickerView *pickerView = [self makeInputPicker];
    [self.selections enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [pickerView selectRow:obj.integerValue inComponent:idx animated:NO];
    }];
    self.inputView = pickerView;
    return [super becomeFirstResponder];
}

#pragma mark - specific for the picker text field

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return NO;
}

- (CGRect)caretRectForPosition:(UITextPosition *)position {
    
    return CGRectZero;
}

#pragma mark - private, abstract

-(UIPickerView*)makeInputPicker {

    NSAssert(0, nil);
    return nil;
}

-(NSString *)makeTextFromSelections {
    
    NSAssert(0, nil);
    return nil;
}

-(instancetype)rhb_defaultStyle {
    
    CGFloat cornerRadius = (CGFloat)[[[self.subviews firstObject] valueForKey:NSStringFromSelector(@selector(cornerRadius))] doubleValue];
    return [[[[self rhb_arrowDown] rhb_pickerLabelTextAlignment:NSTextAlignmentCenter] rhb_enabledBlockWithTransparency:(CGFloat)0.5] rhb_highlightBorderWithRadius:cornerRadius width:1];
}

@end
