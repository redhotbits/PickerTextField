//
//  PickerTuple.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PickerTypes.h"


@interface PickerTuple : NSObject

@property (nonatomic) PickerData *data;
@property (nonatomic) PickerCompletionHandler completion;
@property (nonatomic) UIFont *font;

-(instancetype)initWithData:(PickerData *)data font:(UIFont *)font completion:(PickerCompletionHandler)completion;

@end
