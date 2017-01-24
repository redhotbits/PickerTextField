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

-(void)registerDelegatesWithData:(NSArray<NSArray *> *)data dataFont:(UIFont *)dataFont selectionHandler:(SelectionHandlerType)selectionHandler {

    _data = data;
    _dataFont = dataFont;
    _selectionHandler = selectionHandler;
    
    self.dataSource = [MultiArrayPickerDelegate sharedInstance];
    self.delegate = [MultiArrayPickerDelegate sharedInstance];
}

@end
