//
//  MultiArrayPickerView.h
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MultiArrayTextField;


@interface MultiArrayPickerView : UIPickerView

@property (nonatomic, readonly) MultiArrayTextField *multiArrayTextField;
-(void)registerWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField;

@end
