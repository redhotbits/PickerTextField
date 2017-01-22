//
//  DataSourceManager.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

@import UIKit;
#import <RHBSnippetsObjC/RHBSnippets.h>

typedef NSArray<NSArray *>* PickerData;

@interface DataSourceManager : NSObject

RHB_SINGLETON_DECLARATION();

-(void)registerPicker:(UIPickerView *)pickerView data:(PickerData)data;
-(void)unregisterPicker:(UIPickerView *)pickerView;

@end
