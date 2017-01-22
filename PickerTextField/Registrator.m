//
//  Registrator.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "Registrator.h"


@implementation Registrator

RHB_SINGLETON_IMPLEMENTATION();

-(instancetype)init {
    
    if (self = [super init]) {
        
        _registeredWeakToStrong = [NSMapTable weakToStrongObjectsMapTable];
    }
    return self;
}

@end
