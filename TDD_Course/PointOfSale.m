//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "PointOfSale.h"
#import "Operation.h"

@interface PointOfSale ()
@property(nonatomic, strong) NSDictionary *operations;
@end

@implementation PointOfSale

+ (PointOfSale *)pointOfSaleWithOperations:(NSDictionary *)operations {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.operations = operations;
  return sale;
}

#pragma mark - Controller

- (void)execute:(Command *)command {
  id<Operation> operation = self.operations[command.class];
  [operation run:command];
}

@end