//
//  Registrator.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "Registrator.h"


@interface Registrator()

@property (nonatomic) NSMapTable *registered;

@end


@implementation Registrator

RHB_SINGLETON_IMPLEMENTATION();

-(instancetype)init {
    
    if (self = [super init]) {
        
        _registered = [NSMapTable weakToStrongObjectsMapTable];
    }
    return self;
}

-(void)registratorRegister:(id)key data:(id)data {

    [self.registered setObject:data forKey:key];
}

-(void)registratorUnregister:(id)key {
    
    [self.registered removeObjectForKey:key];
}

-(id)dataForKey:(id)key {
    
    return [self.registered objectForKey:key];
}

@end
