//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "Total.h"
#import "Price.h"


@interface Total ()
@property(nonatomic, strong) NSMutableArray<Price *> *prices;
@end

@implementation Total {

}
- (instancetype)initWithPrices:(NSArray *)prices {
  self = [super init];
  if (self) {
    self.prices = [prices mutableCopy];
  }

  return self;
}

+ (instancetype)totalWithPrices:(NSArray *)prices {
  return [[self alloc] initWithPrices:prices];
}

- (void)addPrice:(Price *)price {
  [self.prices addObject:price];
}

- (BOOL)isEqual:(id)other {
  if (other == self)
    return YES;
  if (!other || ![[other class] isEqual:[self class]])
    return NO;

  return [self isEqualToTotal:other];
}

- (BOOL)isEqualToTotal:(Total *)total {
  if (self == total)
    return YES;
  if (total == nil)
    return NO;
  return !(self.prices != total.prices && ![self.prices isEqualToArray:total.prices]);
}

- (NSUInteger)hash {
  return [self.prices hash];
}


@end