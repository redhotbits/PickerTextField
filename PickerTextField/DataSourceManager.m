//
//  DataSourceManager.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "DataSourceManager.h"

@interface DataSourceManager() <UIPickerViewDataSource>

@property (nonatomic) NSMapTable *registeredPickers;

@end


@implementation DataSourceManager

RHB_SINGLETON_IMPLEMENTATION();

-(instancetype)init {
    
    if (self = [super init]) {
        
        _registeredPickers = [NSMapTable weakToStrongObjectsMapTable];
    }
    return self;
}

-(void)registerPicker:(UIPickerView *)pickerView data:(PickerData)data {
    
    [self.registeredPickers setObject:data forKey:pickerView];
    pickerView.dataSource = self;
}

-(void)unregisterPicker:(UIPickerView *)pickerView {
    
    [self.registeredPickers removeObjectForKey:pickerView];
}

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    PickerData data = [self.registeredPickers objectForKey:pickerView];
    return data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    PickerData data = [self.registeredPickers objectForKey:pickerView];
    return data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    PickerData data = [self.registeredPickers objectForKey:pickerView];
    return data[component][row];
}


@end
