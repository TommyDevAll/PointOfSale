//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@protocol Catalog <NSObject>
- (Item *)findPrice:(const NSString *)barcode;
@end