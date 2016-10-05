//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Price;

@interface Cart : NSObject
- (instancetype)initWithPrices:(NSArray<Price *> *)prices;

+ (instancetype)cartWithPrices:(NSArray<Price *> *)prices;

- (void)addPrice:(Price *)price;

- (int)total;

- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToTotal:(Cart *)cart;

- (NSUInteger)hash;

@end