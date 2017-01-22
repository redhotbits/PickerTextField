//
//  Registrator.h
//  PickerTextField
//
//  Created by Lazar Otasevic on 1/22/17.
//  Copyright © 2017 Red Hot Bits. All rights reserved.
//

@import Foundation;
#import <RHBSnippetsObjC/RHBSnippets.h>


@interface Registrator : NSObject

RHB_SINGLETON_DECLARATION();

@property (nonatomic, readonly) NSMapTable *registeredWeakToStrong;

@end
