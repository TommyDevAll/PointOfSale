//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "CommandExecutor.h"
#import "Scanner.h"
#import "Controller.h"
#import "PointOfSale.h"
#import "InMemoryScanner.h"


@interface CommandExecutor ()
@end

@implementation CommandExecutor
- (void)consume:(id<Input>)input {
  while(input.hasNextCommand) {
    [input.nextCommand execute];
  }
}
@end