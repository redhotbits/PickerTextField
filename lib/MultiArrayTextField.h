//
//  MultiArrayTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractPickerTextField.h"


@interface MultiArrayTextField : AbstractPickerTextField

@property (nonatomic) NSArray<NSArray *> *data;

-(void)defaultSetupForViewingWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections;

@end

