//
//  LudiloPickerView.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerTypes.h"


@interface LudiloPickerView : UIPickerView

-(void)registerWithData:(PickerData *)data font:(UIFont *)font completion:(PickerCompletionHandler)completion;

@end
