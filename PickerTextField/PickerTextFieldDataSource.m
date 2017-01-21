//
//  PickerTextFieldDataSource.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PickerTextFieldDataSource.h"


@interface PickerTextFieldDataSource() <UIPickerViewDataSource>

@property (nonatomic) NSArray<NSArray *> *data;

@end


@implementation PickerTextFieldDataSource

-(instancetype)initDataSourceWithPickerView:(UIPickerView *)pickerView data:(NSArray<NSArray *> *)data {
    
    if (self = [super init]) {
        
        _data = data;
        pickerView.dataSource = self;
    }
    
    return self;
}

#pragma mark - data source delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.data[component][row];
}


@end
