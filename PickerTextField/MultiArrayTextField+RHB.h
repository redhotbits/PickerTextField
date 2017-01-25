//
//  MultiArrayTextField+RHB.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayTextField.h"


@interface MultiArrayTextField(RHB)

-(void)rhb_addRightFlipView:(UIView *)view;
+(UILabel *)rhb_arrowLabel;
+(SelectBlock)rhb_defaultSelectBlock;
+(ViewBlock)rhb_defaultViewBlock;

-(void)rhb_setupMirkoStyle;

@end
