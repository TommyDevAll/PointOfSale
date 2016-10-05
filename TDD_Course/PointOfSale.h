//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "commands/Command.h"
#import "Controller.h"
#import "BarcodeScannedCommand.h"

@interface PointOfSale : Controller
+ (PointOfSale *)pointOfSaleWithOperations:(NSDictionary *)dictionary;
@end