//
//  LudiloPickerView.m
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "LudiloPickerView.h"
#import "PickerViewManager.h"


@implementation LudiloPickerView

-(void)registerWithData:(PickerData *)data completion:(PickerCompletionHandler)completion {
    
    [[PickerViewManager sharedInstance] registerPicker:self data:data completion:completion];
}

-(void)dealloc {
    
    [[PickerViewManager sharedInstance] unregisterPicker:self];
}

@end
