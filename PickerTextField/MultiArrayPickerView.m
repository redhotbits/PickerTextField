//
//  MultiArrayPickerView.m
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "MultiArrayPickerView.h"
#import "MultiArrayPickerDelegate.h"


@implementation MultiArrayPickerView

-(void)registerWithMultiArrayTextField:(MultiArrayTextField *)multiArrayTextField {

    _multiArrayTextField = multiArrayTextField;
    
    self.dataSource = [MultiArrayPickerDelegate sharedInstance];
    self.delegate = [MultiArrayPickerDelegate sharedInstance];
}

@end
