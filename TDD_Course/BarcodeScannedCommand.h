//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface BarcodeScannedCommand : Command
@property(nonatomic, copy) NSString *barcode;

+ (instancetype)barcodeScannedWithBarcode:(NSString *)barcode;
@end