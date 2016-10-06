//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Command.h"
#import "BarcodeScannedCommand.h"

@protocol Operation;

@interface Controller : NSObject

- (instancetype)init;
- (instancetype)initWithOperations:(NSDictionary *)operations;

- (void)registerOperation:(id<Operation>)operation forCommandType:(Class)type;
- (void) execute:(Command *)command;
@end