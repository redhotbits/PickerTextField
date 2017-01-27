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

typedef void(^PTFDecoratePickerLabelBlock)(PTFAbstractTextField *field, UILabel *label, NSInteger row, NSInteger component);

@property (nonatomic) PTFDecoratePickerLabelBlock decoratePickerSubviewBlock;
@property (nonatomic) NSArray<NSNumber *> *selections;
-(NSString *)makeTextFromSelections;
-(instancetype)rhb_defaultStyle;

@end


#import "PTFAbstractTextField+Extras.h"
