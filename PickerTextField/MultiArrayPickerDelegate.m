//
//  MultiArrayPickerDelegate.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayPickerDelegate.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>
#import "PTFPickerView.h"
#import "MultiArrayTextField.h"


@implementation MultiArrayPickerDelegate

RHB_SINGLETON_IMPLEMENTATION();

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    PTFPickerView *castedPicker = [PTFPickerView rhb_verifyCast:pickerView];
    MultiArrayTextField *castedField = [MultiArrayTextField rhb_verifyCast:castedPicker.pickerTextField];
    return castedField.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    PTFPickerView *castedPicker = [PTFPickerView rhb_verifyCast:pickerView];
    MultiArrayTextField *castedField = [MultiArrayTextField rhb_verifyCast:castedPicker.pickerTextField];
    return castedField.data[component].count;
}

#pragma mark - picker view delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    PTFPickerView *castedPicker = [PTFPickerView rhb_verifyCast:pickerView];
    MultiArrayTextField *castedField = [MultiArrayTextField rhb_verifyCast:castedPicker.pickerTextField];
    return castedField.data[component][row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    PTFPickerView *castedPicker = [PTFPickerView rhb_verifyCast:pickerView];
    PTFAbstractTextField *castedField = [PTFAbstractTextField rhb_verifyCast:castedPicker.pickerTextField];
    NSArray<NSNumber *> *selections = castedField.selections;
    if (selections[component].integerValue != row) {
        
        NSMutableArray<NSNumber *> *mutableSelections = selections.mutableCopy;
        mutableSelections[component] = @(row);
        castedField.selections = mutableSelections;
        [castedField updateTextFromSelections];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    PTFPickerView *castedPicker = [PTFPickerView rhb_verifyCast:pickerView];
    PTFAbstractTextField *castedField = [PTFAbstractTextField rhb_verifyCast:castedPicker.pickerTextField];
    return castedField.viewBlock(castedField, pickerView, row, component, view);
}

@end
