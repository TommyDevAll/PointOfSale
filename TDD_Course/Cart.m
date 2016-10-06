//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "Cart.h"
#import "Item.h"


@interface Cart ()
@property(nonatomic, strong) NSMutableArray<Item *> *prices;
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

+ (instancetype)cartWithPrices:(NSArray<Item *> *)prices {
  return [[self alloc] initWithPrices:prices];
}

- (void)addPrice:(Item *)price {
  [self.prices addObject:price];
}

- (int)total {
  int amount = 0;
  for(Item *price in self.prices)
    amount += price.cents;
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