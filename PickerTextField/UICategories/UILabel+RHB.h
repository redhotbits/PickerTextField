//
//  UILabel+RHB.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel(RHB)

-(instancetype)rhb_text:(NSString *)text;
-(instancetype)rhb_font:(UIFont *)font;
-(instancetype)rhb_textAlignment:(NSTextAlignment)textAlignment;

@end
