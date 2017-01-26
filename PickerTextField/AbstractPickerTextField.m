//
//  AbstractPickerTextField.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "AbstractPickerTextField.h"
#import "UIView+RHB.h"


@interface AbstractPickerTextField()<AbstractPickerTextFieldPrivate>
@end


@implementation AbstractPickerTextField

-(BOOL)resignFirstResponder {
    
    self.inputView = nil;
    return [super resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    
    self.inputView = [self makeInputPicker];
    [self rhb_addAutomaticResignRecognizer];
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
