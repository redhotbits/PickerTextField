//
//  PickerTextFieldDataSource.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

@import UIKit;


@interface PickerTextFieldDataSource : NSObject

-(instancetype)initDataSourceWithPickerView:(UIPickerView *)pickerView data:(NSArray<NSArray *> *)data;

@end
