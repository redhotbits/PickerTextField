//
//  Registrator+UIPickerView.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "Registrator+UIPickerView.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>
#import "PickerTuple.h"


@implementation Registrator(UIPickerView)

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    PickerTuple *tuple = [PickerTuple rhb_verifyCast:[self.registeredWeakToStrong objectForKey:pickerView]];
    return tuple.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    PickerTuple *tuple = [PickerTuple rhb_verifyCast:[self.registeredWeakToStrong objectForKey:pickerView]];
    return tuple.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    PickerTuple *tuple = [PickerTuple rhb_verifyCast:[self.registeredWeakToStrong objectForKey:pickerView]];
    return tuple.data[component][row];
}

#pragma mark - picker view delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    PickerTuple *tuple = [PickerTuple rhb_verifyCast:[self.registeredWeakToStrong objectForKey:pickerView]];
    tuple.completion(pickerView);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *retval = [UILabel rhb_verifyCast:view];
    if (!retval) {
        
        retval = [[UILabel alloc] initWithFrame:(CGRect){CGPointZero, [pickerView rowSizeForComponent:component]}];
    }
    
    retval.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    PickerTuple *tuple = [PickerTuple rhb_verifyCast:[self.registeredWeakToStrong objectForKey:pickerView]];
    retval.font = tuple.font;
    retval.textAlignment = NSTextAlignmentCenter;
    
    return retval;
}

@end
