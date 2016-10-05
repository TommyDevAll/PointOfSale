//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Controller;
@protocol Input;


@interface CommandExecutor : NSObject
- (void)consume:(id<Input>)input;
@end