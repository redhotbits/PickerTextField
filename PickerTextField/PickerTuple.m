//
//  PickerTuple.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PickerTuple.h"


@implementation PickerTuple

-(instancetype)initWithData:(PickerData *)data font:(UIFont *)font completion:(PickerCompletionHandler)completion {
    
    if (self = [super init]) {
        
        _data = data;
        _font = font;
        _completion = completion;
    }
    return self;
}

@end
