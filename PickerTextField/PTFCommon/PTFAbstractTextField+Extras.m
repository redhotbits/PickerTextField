//
//  PTFAbstractTextField+Extras.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFAbstractTextField+Extras.h"
#import "UILabel+RHB.h"
#import "UITextField+RHB.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>


@implementation PTFAbstractTextField(Extras)

+(PTFPickerSubviewBlock)labelViewBlockWithTextAlignment:(NSTextAlignment)textAlignment {
    
    return ^UIView*(PTFAbstractTextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView) {
        
        UILabel *retval = [UILabel rhb_verifyCast:reuseView];
        if (!retval) {
            
            retval = [UILabel new];
        }
        
        retval.text = [pickerView.delegate pickerView:pickerView titleForRow:row forComponent:component];
        retval.font = field.font;
        retval.textAlignment = textAlignment;
        
        return retval;
    };
}

-(void)setupMirkoStyle {
    
    self.pickerSubviewBlock = [[self class] labelViewBlockWithTextAlignment:NSTextAlignmentCenter];
    UILabel *label = [UILabel rhb_arrowDown];
    label.font = self.font;
    [self rhb_addRightFlipView:label];
    self.enableBlock = ^(RHBUITextField *field, BOOL flag){
        
        field.alpha = flag ? 1 : (CGFloat)0.5;
    };
}

@end
