//
//  LudiloTextField.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "LudiloTextField.h"
#import "Registrator+UITextField.h"


@implementation LudiloTextField

-(void)registerDelegate {

    [[Registrator sharedInstance].registeredWeakToStrong setObject:nil forKey:self];
    self.delegate = [Registrator sharedInstance];
}

-(void)dealloc {

    [[Registrator sharedInstance].registeredWeakToStrong removeObjectForKey:self];
}

@end
