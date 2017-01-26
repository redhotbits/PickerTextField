//
//  RHBTextFieldPickerView.h
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AbstractPickerTextField;
@class MultiArrayTextField;


@interface RHBTextFieldPickerView : UIPickerView

-(instancetype)init NS_UNAVAILABLE;
-(instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
-(instancetype)initWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly, weak) AbstractPickerTextField *pickerTextField;

@end
