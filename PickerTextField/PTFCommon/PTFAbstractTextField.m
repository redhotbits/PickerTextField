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

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return NO;
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
    
    return [[[self rhb_arrowDown] rhb_pickerLabelTextAlignment:NSTextAlignmentCenter] rhb_enabledBlockWithTransparency:(CGFloat)0.5];
}

@end
