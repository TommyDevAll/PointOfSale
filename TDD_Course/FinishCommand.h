//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@protocol FinishCommandHandler <NSObject>
-(void)onFinishCommand;
@end

@interface FinishCommand : Command
- (instancetype)initWithHandler:(id <FinishCommandHandler>)handler;

+ (instancetype)commandWithHandler:(id <FinishCommandHandler>)handler;


@end