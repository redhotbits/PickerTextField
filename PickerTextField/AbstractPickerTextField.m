//
//  AbstractPickerTextField.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "AbstractPickerTextField.h"


@interface AbstractPickerTextField()<AbstractPickerTextFieldPrivate>
@end


@implementation AbstractPickerTextField

-(BOOL)resignFirstResponder {
    
    self.inputView = nil;
    return [super resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    
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

-(void)updateTextFromSelections {
    
    self.text = [self makeTextFromSelections];
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

@end
