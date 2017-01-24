//
//  MultiArrayPickerView.h
//  MultiArrayTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MultiArrayPickerView : UIPickerView

typedef void(^SelectionHandlerType)(MultiArrayPickerView *pickerView);

@property (nonatomic, readonly) NSArray<NSArray *> *data;
@property (nonatomic, readonly) UIFont *dataFont;
@property (nonatomic, readonly) SelectionHandlerType selectionHandler;

-(void)registerDelegatesWithData:(NSArray<NSArray *> *)data dataFont:(UIFont *)dataFont selectionHandler:(SelectionHandlerType)selectionHandler;

@end
