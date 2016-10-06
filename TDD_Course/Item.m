//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "Item.h"
#import "Cart.h"


@implementation Item
+ (id)priceWithValue:(int)cents {
  Item *item = [Item new];
  item.cents = cents;
  return item;
}
@end