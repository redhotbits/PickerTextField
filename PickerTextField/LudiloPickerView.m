//
//  LudiloPickerView.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "LudiloPickerView.h"
#import "Registrator+UIPickerView.h"
#import "PickerTuple.h"


@implementation LudiloPickerView

-(void)registerWithData:(PickerData *)data font:(UIFont *)font completion:(PickerCompletionHandler)completion{
    
    PickerTuple *tuple = [[PickerTuple alloc] initWithData:data font:font completion:completion];
    [[Registrator sharedInstance] registratorRegister:self data:tuple];
    self.dataSource = [Registrator sharedInstance];
    self.delegate = [Registrator sharedInstance];
}

-(void)dealloc {
    
    [[Registrator sharedInstance] registratorUnregister:self];
}

@end
