//
//  MultiArrayTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTFAbstractTextField.h"


@interface MultiArrayTextField : PTFAbstractTextField

@property (nonatomic) NSArray<NSArray *> *data;

-(void)setupWithData:(NSArray<NSArray *> *)data selections:(NSArray<NSNumber *> *)selections;

@end

