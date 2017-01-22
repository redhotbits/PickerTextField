//
//  GenericPicker.m
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/10/17.
//  Copyright © 2016 SMI Media Tech LLC. All rights reserved.
//

#import "GenericPicker.h"
#import "PickerViewManager.h"


@implementation GenericPicker

-(instancetype)initWithData:(PickerData *)pickerData andCompletionHandler:(PickerCompletionHandler)completion {
	
    if (self = [super init]) {
        
		_picker = [UIPickerView new];
        [[PickerViewManager sharedInstance] registerPicker:self.picker data:pickerData completion:completion];
	}
	return self;
}

-(void)dealloc {

    [[PickerViewManager sharedInstance] unregisterPicker:self.picker];
}

@end
