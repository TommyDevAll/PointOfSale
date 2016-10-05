//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "FinishCommand.h"


@interface FinishCommand()
@property id<FinishCommandHandler> handler;
@end

@implementation FinishCommand

- (instancetype)initWithHandler:(id <FinishCommandHandler>)handler {
  self = [super init];
  if (self) {
    self.handler = handler;
  }

  return self;
}

+ (instancetype)commandWithHandler:(id <FinishCommandHandler>)handler {
  return [[self alloc] initWithHandler:handler];
}

- (void)execute {
  [self.handler onFinishCommand];
}

@end