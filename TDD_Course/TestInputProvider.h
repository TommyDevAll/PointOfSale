//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Input.h"


@interface TestInputProvider : NSObject <Input>
- (instancetype)initWithCommands:(NSArray<Command *> *)commands;

+ (instancetype)providerWithCommands:(NSArray<Command *> *)commands;


@end