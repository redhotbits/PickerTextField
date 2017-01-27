//
//  PTFAbstractTextField+Extras.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFAbstractTextField+Extras.h"
#import "UILabel+RHB.h"
#import "UIView+RHB.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>


@implementation PTFAbstractTextField(Extras)

-(instancetype)rhb_pickerLabelTextAlignment:(NSTextAlignment)textAlignment {
 
    self.decoratePickerSubviewBlock = ^(PTFAbstractTextField *field, UILabel *label, NSInteger row, NSInteger component){
      
        label.textAlignment = textAlignment;
    };
    return self;
}

-(instancetype)rhb_arrowDown {
    
    UILabel *label = [[[[[UILabel alloc] initWithFrame:(CGRect){CGPointZero, self.rhb_squareHeightSize}] rhb_font:self.font] rhb_textAlignment:NSTextAlignmentCenter] rhb_text:@"▼"];
    return [self rhb_rightView:label rightViewMode:UITextFieldViewModeAlways];
}

-(instancetype)rhb_highlightBorderWithWidth:(CGFloat)width {
    
    self.highligtedBlock = ^(RHBUITextField *field, BOOL flag) {
      
        CGFloat cornerRadius = (CGFloat)[[[field.subviews firstObject] valueForKey:NSStringFromSelector(@selector(cornerRadius))] doubleValue];
        
        if (cornerRadius) {
            
            field.layer.cornerRadius = cornerRadius;
        }
        
        field.layer.borderWidth = flag ? width : 0;
        field.layer.borderColor = field.textColor.CGColor;
    };
    return self;
}


@end
