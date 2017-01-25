//
//  RHBTextFieldWithPickerProtocol.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/25/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RHBTextFieldWithPickerProtocol <NSObject>

-(NSMutableArray<NSNumber *> *) internalSelections;

@end
