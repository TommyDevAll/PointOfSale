//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Price;

@interface Total : NSObject
- (instancetype)initWithPrices:(NSArray<Price *> *)prices;

+ (instancetype)totalWithPrices:(NSArray<Price *> *)prices;

- (void)addPrice:(Price *)price;

- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToTotal:(Total *)total;

- (NSUInteger)hash;

@end