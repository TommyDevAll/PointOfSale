//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface Cart : NSObject
- (instancetype)initWithPrices:(NSArray<Item *> *)prices;

+ (instancetype)cartWithPrices:(NSArray<Item *> *)prices;

- (void)addPrice:(Item *)price;

- (int)total;

- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToTotal:(Cart *)cart;

- (NSUInteger)hash;

@end