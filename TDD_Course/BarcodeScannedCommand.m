//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "BarcodeScannedCommand.h"

@implementation BarcodeScannedCommand

+ (instancetype)barcodeScannedWithBarcode:(NSString *)barcode {
  BarcodeScannedCommand *command = [BarcodeScannedCommand new];
  command.barcode = barcode;
  return command;
}


@end