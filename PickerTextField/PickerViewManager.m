//
//  PickerViewManager.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PickerViewManager.h"


@interface PickerTuple : NSObject

@property PickerData *data;
@property PickerCompletionHandler completion;

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

-(void)registerPicker:(UIPickerView *)pickerView data:(PickerData *)data completion:(PickerCompletionHandler)completion {
    
    PickerTuple *tuple = [PickerTuple new];
    tuple.data = data;
    tuple.completion = completion;
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
    
    UILabel *retval = (id)view;
    if (!retval) {
        CGRect rect = (CGRect){CGPointZero, [pickerView rowSizeForComponent:component]};
        rect.origin.x += pickerView.layoutMargins.left;
        rect.size.width -= pickerView.layoutMargins.left + pickerView.layoutMargins.right;
        retval= [[UILabel alloc] initWithFrame:rect];
    }
    
    PickerTuple *tuple = [self.registeredPickers objectForKey:pickerView];
    retval.text = tuple.data[component][row];
    retval.font = [UIFont systemFontOfSize:16];
    retval.textAlignment = NSTextAlignmentCenter;
    
    return retval;
}


@end
