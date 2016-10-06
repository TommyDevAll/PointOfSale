//
// Created by Tommaso Resti on 06/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Catalog.h"

@interface InMemoryCatalog : NSObject <Catalog>
- (instancetype)initWithPrices:(NSDictionary<const NSString *, Item *> *)prices;

+ (instancetype)catalogWithPrices:(NSDictionary<const NSString *, Item *> *)prices;


@end