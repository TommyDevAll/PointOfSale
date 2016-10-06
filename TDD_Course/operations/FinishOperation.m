//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "FinishOperation.h"
#import "Cart.h"
#import "Display.h"


@implementation FinishOperation
+ (id)operationWithCart:(Cart *)cart andDisplay:(id)display {
  FinishOperation *operation = [FinishOperation new];
  operation.cart = cart;
  operation.display = display;
  return operation;
}

- (void)run:(Command *)command {
  [self.display displayTotal:self.cart.total];
}
@end
