//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Command.h"
#import "Controller.h"
#import "BarcodeScannedCommand.h"

@protocol Catalog;
@protocol Display;
@class Cart;


@interface PointOfSale : Controller
+ (PointOfSale *)pointOfSaleWithCatalog:(id)catalog andDisplay:(id)display;

+ (PointOfSale *)pointOfSaleWithCatalog:(id <Catalog>)catalog andDisplay:(id <Display>)display andCart:(Cart *)cart;
@end