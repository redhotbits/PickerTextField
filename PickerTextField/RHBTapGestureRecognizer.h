//
//  RHBTapGestureRecognizer.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RHBTapGestureRecognizer : UITapGestureRecognizer

typedef void(^ActionBlock)(RHBTapGestureRecognizer *recognizer);
@property (nonatomic) ActionBlock actionBlock;

-(instancetype)init NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithTarget:(id)target action:(SEL)action NS_UNAVAILABLE;

@end
