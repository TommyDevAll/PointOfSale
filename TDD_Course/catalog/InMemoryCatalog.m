//
// Created by Tommaso Resti on 06/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "InMemoryCatalog.h"


@interface InMemoryCatalog ()
@property(nonatomic, strong) NSDictionary<const NSString *, Item *> *prices;
@end

@implementation InMemoryCatalog

- (instancetype)initWithPrices:(NSDictionary<const NSString *, Item *> *)prices {
  self = [super init];
  if (self) {
    self.prices = prices;
  }

  return self;
}

+ (instancetype)catalogWithPrices:(NSDictionary<const NSString *, Item *> *)prices {
  return [[self alloc] initWithPrices:prices];
}


- (Item *)findPrice:(const NSString *)barcode {
  return self.prices[barcode];
}

@end