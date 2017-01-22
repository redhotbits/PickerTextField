//
//  PickerViewManager.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PickerViewManager.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>


@interface PickerTuple : NSObject

@property PickerData *data;
@property PickerCompletionHandler completion;
@property UIFont *font;

@end @implementation PickerTuple @end



@interface PickerViewManager() <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) NSMapTable *registeredPickers;

@end


@implementation PickerViewManager

RHB_SINGLETON_IMPLEMENTATION();

-(instancetype)init {
    
    if (self = [super init]) {
        
        _registeredPickers = [NSMapTable weakToStrongObjectsMapTable];
    }
    return self;
}

-(void)registerPicker:(UIPickerView *)pickerView data:(PickerData *)data font:(UIFont *)font completion:(PickerCompletionHandler)completion {
    
    PickerTuple *tuple = [PickerTuple new];
    tuple.data = data;
    tuple.completion = completion;
    tuple.font = font;
    [self.registeredPickers setObject:tuple forKey:pickerView];
    pickerView.dataSource = self;
    pickerView.delegate = self;
}

-(void)unregisterPicker:(UIPickerView *)pickerView {
    
    [self.registeredPickers removeObjectForKey:pickerView];
}

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    return tuple.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    return tuple.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    return tuple.data[component][row];
}

#pragma mark - picker view delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    tuple.completion(pickerView);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *retval = [UILabel rhb_verifyCast:view];
    if (!retval) {
        
        retval = [[UILabel alloc] init];
    }
    
    retval.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    retval.font = tuple.font;
    retval.textAlignment = NSTextAlignmentCenter;
    
    return retval;
}


@end
