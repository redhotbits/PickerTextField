//
//  PTFAbstractTextField+Extras.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFAbstractTextField.h"


@protocol PTFAbstractTextFieldPrivateExtras <NSObject>

-(PTFAbstractTextField *)rhb_pickerLabelTextAlignment:(NSTextAlignment)textAlignment;
-(PTFAbstractTextField *)rhb_arrowDown;

@end


@interface PTFAbstractTextField(Extras)

-(instancetype)rhb_mirkoStyle;

@end
