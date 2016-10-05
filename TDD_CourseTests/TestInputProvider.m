//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "TestInputProvider.h"


@interface TestInputProvider ()
@property(nonatomic) NSMutableArray <Command *> *commands;
@end

@implementation TestInputProvider {

}

- (instancetype)initWithCommands:(NSArray<Command *> *)commands {
  self = [super init];
  if (self) {
    self.commands = commands.mutableCopy;
  }

  return self;
}

+ (instancetype)providerWithCommands:(NSArray<Command *> *)commands {
  return [[self alloc] initWithCommands:commands];
}


- (BOOL)hasNextCommand {
  return self.commands.count > 0;
}

- (Command *)nextCommand {
  Command *command = self.commands[0];
  [self.commands removeObjectAtIndex:0];
  return command;
}


@end