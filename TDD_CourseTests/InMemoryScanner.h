//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scanner.h"

@class PointOfSale;
@protocol BarcodeScannedCommandHandler;

@interface InMemoryScanner : NSObject <Scanner>
- (instancetype)initWithBarcodes:(NSArray *)barcodes andScanHandler:(id <BarcodeScannedCommandHandler>)handler;
+ (instancetype)scannerWithBarcodes:(NSArray *)barcodes andScanHandler:(PointOfSale *)handler;
@end