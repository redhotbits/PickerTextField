//
//  AbstractPickerTextField.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBUITextField.h"


typedef UIView*(^ViewBlock)(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView);


@protocol AbstractPickerTextFieldPrivate <NSObject>

// ova dva implementiras
-(UIPickerView*)makeInputPicker;
-(NSString *)makeTextFromSelections;

@end


@interface AbstractPickerTextField : RHBUITextField

@property (nonatomic) ViewBlock viewBlock;
@property (nonatomic) NSArray<NSNumber *> *selections;
-(void)updateTextFromSelections;

@end
