//
//  PickerTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerTypes.h"


@interface PickerTextField : UITextField <UITextFieldDelegate>

@property (nonatomic) UILabel *arrowLabel;

@property (nonatomic) PickerData *data;

@end
