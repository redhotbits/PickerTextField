//
//  MultiArrayTextField.h
//  Saath Sangeet
//
//  Created by Mirko Tomic on 1/15/17.
//  Copyright © 2017 SMI Media Tech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MultiArrayTextField : UITextField

@property (nonatomic) UILabel *arrowLabel;

@property (nonatomic) NSArray<NSArray *> *data;

@end
