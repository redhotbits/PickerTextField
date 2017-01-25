//
//  RHBTapGestureRecognizer.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RHBTapGestureRecognizer : UITapGestureRecognizer

typedef void(^ActionBlock)(UITapGestureRecognizer *recognizer);

-(instancetype)initWithBlock:(ActionBlock)actionBlock NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithTarget:(nullable id)target action:(nullable SEL)action NS_UNAVAILABLE;

@end
