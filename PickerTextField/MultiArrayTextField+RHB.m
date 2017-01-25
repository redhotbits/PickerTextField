//
//  MultiArrayTextField+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayTextField+RHB.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>
#import "UILabel+RHB.h"
#import "UIView+RHB.h"
#import <BlocksKit/BlocksKit.h>


@implementation MultiArrayTextField(RHB)

-(void)rhb_addRightFlipView:(UIView *)view {
    
    view.frame = (CGRect){CGPointZero, self.rhb_squareHeightSize};
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = view;
}

+(ViewBlock)rhb_labelViewBlock {
    
    return ^UIView*(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView) {
        
        UILabel *retval = [UILabel rhb_verifyCast:reuseView];
        if (!retval) {
            
            retval = [UILabel new];
        }
        
        retval.text = [pickerView.delegate pickerView:pickerView titleForRow:row forComponent:component];
        retval.font = field.font;
        
        return retval;
    };
}

-(void)rhb_setupMirkoStyle {
    
    ViewBlock defaultBlock = [[self class] rhb_labelViewBlock];
    self.viewBlock = ^UIView*(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView) {
        
        UIView *view = defaultBlock(field, pickerView, row, component, reuseView);
        UILabel *label = [UILabel rhb_verifyCast:view];
        label.textAlignment = NSTextAlignmentCenter;
        return label;
    };
    [self rhb_addRightFlipView:[UILabel rhb_arrowDown]];
}


@end
