//
//  PickerTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericPicker.h"

@interface PickerTextField : UITextField <UITextFieldDelegate>


@property (strong, nonatomic) UILabel *arrowLabel;

@property (strong, nonatomic) UITapGestureRecognizer *dismissTapRecognizer;

@property (strong, nonatomic) GenericPicker *picker;

@property (strong, nonatomic) NSArray *data;

@end
