//
// Created by Tommaso Resti on 06/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"

@class BarcodeScannedOperation;
@class FinishOperation;

@interface PointOfSaleController : Controller
+ (PointOfSaleController *)controllerWithScanOperation:(BarcodeScannedOperation *)scannedOperation andCheckoutOperation:(FinishOperation *)finishOperation;
@end