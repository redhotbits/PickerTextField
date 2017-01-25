//
//  MultiArrayTextField+RHB.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayTextField+RHB.h"
#import <RHBCastingObjC/NSObject+RHBCasting.h>


@implementation MultiArrayTextField(RHB)

-(void)rhb_addRightFlipView:(UIView *)view {
    
    CGFloat height = self.frame.size.height;
    view.frame = (CGRect){CGPointZero, CGSizeMake(height, height)};
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = view;
}

+(UILabel *)rhb_arrowLabel {
    
    UILabel *arrow = [UILabel new];
    arrow.text = @"▼";
    arrow.textAlignment = NSTextAlignmentCenter;
    return arrow;
}

+(SelectBlock)rhb_defaultSelectBlock {

    return ^(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component) {
        
        MultiArrayTextField *multiArrayPickerField = [MultiArrayTextField rhb_verifyCast:field];
        NSArray<NSArray *> *data = multiArrayPickerField.data;
        NSMutableArray* selected = [NSMutableArray array];
        for(NSInteger i=0;i<data.count;i++){
            NSInteger selectedIndex = [pickerView selectedRowInComponent:i];
            [selected addObject:data[i][selectedIndex]];
        }
        
        field.text = [selected componentsJoinedByString:@" - "];
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
    [self rhb_addRightFlipView:[[self class] rhb_arrowLabel]];
}


@end
