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
+(ViewBlock)rhb_labelViewBlockWithTextAlignment:(NSTextAlignment)textAlignment;
-(void)rhb_setupMirkoStyle;
-(void)rhb_setupForViewingWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections;


@end
