//
//  PTFAbstractTextField.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "RHBUITextField.h"



@protocol PTFAbstractTextFieldPrivate <NSObject>

-(UIPickerView*)makeInputPicker;

@end


@interface PTFAbstractTextField : RHBUITextField

typedef UIView*(^PTFPickerSubviewBlock)(PTFAbstractTextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView);

@property (nonatomic) PTFPickerSubviewBlock pickerSubviewBlock;
@property (nonatomic) NSArray<NSNumber *> *selections;
-(NSString *)makeTextFromSelections;

@end


#import "PTFAbstractTextField+Extras.h"
