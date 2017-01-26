//
//  PTFAbstractTextField+Extras.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/26/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "PTFAbstractTextField.h"


@interface PTFAbstractTextField(Extras)

+(PTFPickerSubviewBlock)labelViewBlockWithTextAlignment:(NSTextAlignment)textAlignment;
-(void)setupMirkoStyle;

@end