//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"

@class Cart;
@protocol Catalog;
@protocol Display;


@interface BarcodeScannedOperation : NSObject <Operation>
@property (weak) id<Display> display;
@property (weak) id<Catalog> catalog;
@property (weak) Cart *cart;

+ (id)operationWithCatalog:(id)catalog cart:(Cart *)cart andDisplay:(id)display;
@end