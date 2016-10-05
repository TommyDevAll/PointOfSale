//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "Cart.h"
#import "Price.h"


@interface Cart ()
@property(nonatomic, strong) NSMutableArray<Price *> *prices;
@end

@implementation Cart {

}

-(instancetype)init {
  if(self = [self initWithPrices:@[]]) {
    ;
  }
  return self;
}

- (instancetype)initWithPrices:(NSArray *)prices {
  self = [super init];
  if (self) {
    self.prices = [prices mutableCopy];
  }

  return self;
}

+ (instancetype)cartWithPrices:(NSArray<Price *> *)prices {
  return [[self alloc] initWithPrices:prices];
}

- (void)addPrice:(Price *)price {
  [self.prices addObject:price];
}

- (int)total {
  int amount = 0;
  for(Price *price in self.prices)
    amount += price.value;
  return amount;
}

- (BOOL)isEqual:(id)other {
  if (other == self)
    return YES;
  if (!other || ![[other class] isEqual:[self class]])
    return NO;

  return [self isEqualToTotal:other];
}

- (BOOL)isEqualToTotal:(Cart *)cart {
  if (self == cart)
    return YES;
  if (cart == nil)
    return NO;
  return !(self.prices != cart.prices && ![self.prices isEqualToArray:cart.prices]);
}

- (NSUInteger)hash {
  return [self.prices hash];
}


@end