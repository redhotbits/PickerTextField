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
#import <BlocksKit/BlocksKit.h>
#import "RHBTextFieldWithPickerProtocol.h"


@interface MultiArrayTextField()<RHBTextFieldWithPickerProtocol>
@end

@implementation MultiArrayTextField(RHB)

-(void)rhb_addRightFlipView:(UIView *)view {
    
    CGFloat height = self.frame.size.height;
    view.frame = (CGRect){CGPointZero, CGSizeMake(height, height)};
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = view;
}

+(SelectBlock)rhb_defaultSelectBlock {

    return ^(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component) {
        
        MultiArrayTextField *multiArrayPickerField = [MultiArrayTextField rhb_verifyCast:field];
        NSMutableArray<NSNumber *> *internalSelections = [multiArrayPickerField internalSelections];
        NSNumber *oldrow = internalSelections[component];
        if (oldrow.integerValue == row) {
            
            return;
        }
        internalSelections[component] = @(row);
        [multiArrayPickerField updateTextFromSelections];
    };
}

+(ViewBlock)rhb_defaultViewBlock {
    
    return ^UIView*(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView) {
        
        UILabel *retval = [UILabel rhb_verifyCast:reuseView];
        if (!retval) {
            
            retval = [UILabel new];
        }
        
        retval.text = [pickerView.delegate pickerView:pickerView titleForRow:row forComponent:component];
        retval.font = [UIFont systemFontOfSize:16];
        retval.textAlignment = NSTextAlignmentCenter;
        
        return retval;
    };
}

-(void)rhb_setupMirkoStyle {
    
    self.selectBlock = [[self class] rhb_defaultSelectBlock];
    self.viewBlock = [[self class] rhb_defaultViewBlock];
    [self rhb_addRightFlipView:[UILabel rhb_arrowDown]];
}


@end
