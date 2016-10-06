//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;
@class Cart;

@protocol Display <NSObject>
- (void)displayItemFound:(const Item *)item;
- (void)displayItemNotFound;
- (void)displayTotal: (int)total;
@end