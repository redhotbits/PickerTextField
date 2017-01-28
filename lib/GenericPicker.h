//
//  GenericPicker.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/10/17.
//  Copyright © 2016 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completionHandler) (NSString *selectedString, int selectedRow);

@interface GenericPicker : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong,nonatomic) UIPickerView *picker;
@property (strong,nonatomic) NSArray<NSArray*>* data;

-(instancetype)initWithData:(NSArray *)pickerData andCompletionHandler:(completionHandler) completion;

@end
