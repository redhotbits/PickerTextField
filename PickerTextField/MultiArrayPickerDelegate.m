//
//  MultiArrayPickerDelegate.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayPickerDelegate.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>
#import "MultiArrayPickerView.h"
#import "MultiArrayTextField.h"


@implementation MultiArrayPickerDelegate

RHB_SINGLETON_IMPLEMENTATION();

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.multiArrayTextField.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.multiArrayTextField.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.multiArrayTextField.data[component][row];
}

#pragma mark - picker view delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    MultiArrayTextField *field = casted.multiArrayTextField;
    NSArray<NSNumber *> *selections = field.selections;
    if (selections[component].integerValue != row) {
        
        NSMutableArray<NSNumber *> *mutableSelections = selections.mutableCopy;
        mutableSelections[component] = @(row);
        field.selections = mutableSelections;
        [field updateTextFromSelections];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.multiArrayTextField.viewBlock(casted.multiArrayTextField, pickerView, row, component, view);
}

@end
