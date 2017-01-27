//
//  UILabel+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "UILabel+RHB.h"


@implementation UILabel(RHB)

-(instancetype)rhb_text:(NSString *)text {
    
    self.text = text;
    return self;
}

-(instancetype)rhb_font:(UIFont *)font {
    
    self.font = font;
    return self;
}

-(instancetype)rhb_textAlignment:(NSTextAlignment)textAlignment {
    
    self.textAlignment = textAlignment;
    return self;
}

@end
