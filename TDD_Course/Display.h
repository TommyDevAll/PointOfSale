//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Price;
@class Total;

@protocol Display <NSObject>
- (void)displayPriceFound:(const Price *)price;
- (void)displayPriceNotFound;
- (void)displayTotal: (Total *)total;
@end