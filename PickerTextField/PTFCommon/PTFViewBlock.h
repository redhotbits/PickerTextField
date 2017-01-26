//
//  PTFViewBlock.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#ifndef PTFViewBlock_h
#define PTFViewBlock_h

@import UIKit;

typedef UIView*(^ViewBlock)(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView);

#endif /* PTFViewBlock_h */
