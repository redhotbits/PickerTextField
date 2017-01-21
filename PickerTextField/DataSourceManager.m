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

-(void)registerPicker:(UIPickerView *)pickerView dataGetterBlock:(DataGetterBlockType)dataGetterBlock {
    
    [self.registeredPickers setObject:dataGetterBlock forKey:pickerView];
    pickerView.dataSource = self;
}

-(void)unregisterPicker:(UIPickerView *)pickerView {
    
    [self.registeredPickers removeObjectForKey:pickerView];
}

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    DataGetterBlockType dataGetter = [self.registeredPickers objectForKey:pickerView];
    return dataGetter().count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    DataGetterBlockType dataGetter = [self.registeredPickers objectForKey:pickerView];
    return dataGetter()[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    DataGetterBlockType dataGetter = [self.registeredPickers objectForKey:pickerView];
    return dataGetter()[component][row];
}


@end
