//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"

@class Cart;
@protocol Display;

@interface FinishOperation: NSObject <Operation>
@property (weak) id<Display> display;
@property (weak) Cart *cart;

+ (id)operationWithCart:(Cart *)cart andDisplay:(id)display;
@end