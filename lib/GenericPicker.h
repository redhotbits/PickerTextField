//
//  GenericPicker.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/10/17.
//  Copyright © 2016 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerTypes.h"


@interface GenericPicker : NSObject

@property (nonatomic,readonly) UIPickerView *picker;

-(instancetype)initWithData:(PickerData *)pickerData andCompletionHandler:(PickerCompletionHandler) completion;

@end
