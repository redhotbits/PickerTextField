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


@implementation MultiArrayPickerDelegate

RHB_SINGLETON_IMPLEMENTATION();

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    return casted.data[component][row];
}

#pragma mark - picker view delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    casted.selectionHandler(casted);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *retval = [UILabel rhb_verifyCast:view];
    if (!retval) {
        
        retval = [UILabel new];
    }
    
    retval.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    MultiArrayPickerView *casted = [MultiArrayPickerView rhb_verifyCast:pickerView];
    retval.font = casted.dataFont;
    retval.textAlignment = NSTextAlignmentCenter;
    
    return retval;
}

@end
