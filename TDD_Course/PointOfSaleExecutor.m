//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "PointOfSaleExecutor.h"
#import "Scanner.h"
#import "controllers/Controller.h"


@interface PointOfSaleExecutor ()
@property(nonatomic, strong) Controller* controller;
@end

@implementation PointOfSaleExecutor

- (instancetype)initWithController:(Controller *)controller {
  self = [super init];
  if (self) {
    self.controller = controller;
  }

  return self;
}

+ (instancetype)executorWithOperationRouter:(Controller *)controller {
  return [[self alloc] initWithController:controller];
}


- (void)consume:(id<Input>)input {
  while(input.hasNextCommand) {
    [self.controller execute: input.nextCommand];
  }
}
@end