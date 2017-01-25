//
//  ViewController.m
//  MultiArrayTextField
//
//  Created by Mirko Tomic on 1/21/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

#import "ViewController.h"
#import "MultiArrayTextField+RHB.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.picker.data = @[@[@"test",@"test2",@"test3",@"test4",@"test5",@"test6",@"test7",@"test8",@"test9"]];
    self.picker.data = @[@[@"test",@"test2"],@[@"test3",@"test4"]];
    self.picker2.data = @[@[@"1", @"2"],@[@"3", @"4"], @[@"1", @"2", @"3", @"4"]];
    [self.picker setupMirko];
    [self.picker2 setupMirko];
}

@end
