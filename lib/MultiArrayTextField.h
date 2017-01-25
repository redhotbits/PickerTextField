//
//  MultiArrayTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView*(^ViewBlock)(UITextField *field, UIPickerView *pickerView, NSInteger row, NSInteger component, UIView *reuseView);


@interface MultiArrayTextField : UITextField

@property (nonatomic) ViewBlock viewBlock;

@property (nonatomic) NSArray<NSArray *> *data;
@property (nonatomic) NSArray<NSNumber *> *selections;

-(void)updateTextFromSelections;

@end

