//
//  PickerViewManager.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

@import UIKit;
#import <RHBSnippetsObjC/RHBSnippets.h>
#import "PickerTypes.h"

@interface PickerViewManager : NSObject

RHB_SINGLETON_DECLARATION();

-(void)registerPicker:(UIPickerView *)pickerView data:(PickerData *)data completion:(PickerCompletionHandler)completion;
-(void)unregisterPicker:(UIPickerView *)pickerView;

@end
