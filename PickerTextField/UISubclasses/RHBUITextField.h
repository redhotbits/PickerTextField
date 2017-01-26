//
//  TextFieldWithBlocks.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/24/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RHBUITextField : UITextField

typedef void(^FlagBlock)(RHBUITextField *field, BOOL flag);

@property (nonatomic) FlagBlock enableBlock;

@end
