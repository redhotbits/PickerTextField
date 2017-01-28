//
//  GenericPicker.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/10/17.
//  Copyright © 2016 SMI Media Tech LLC. All rights reserved.
//

#import "GenericPicker.h"

@interface GenericPicker ()
@property (copy,nonatomic) completionHandler compBlock;
@end

@implementation GenericPicker

-(instancetype)initWithData:(NSArray *)pickerData andCompletionHandler:(completionHandler)completion {
	if (self = [super init]) {
		self.picker = [UIPickerView new];
		self.picker.delegate = self;
		self.picker.dataSource = self;
		self.data = pickerData;
		self.compBlock = completion;
	}
	return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return self.data.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return self.data[component].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return self.data[component][row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	self.compBlock(self.data[component][row], (int)row);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	UILabel *retval = (id)view;
	if (!retval) {
		retval= [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 0.0f, [pickerView rowSizeForComponent:component].width - 16.0f, [pickerView rowSizeForComponent:component].height)];
	}
	
	retval.text = self.data[component][row];
	retval.font = [UIFont systemFontOfSize:16];
	retval.textAlignment = NSTextAlignmentCenter;
	
	return retval;
}

@end
