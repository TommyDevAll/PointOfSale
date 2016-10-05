//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "BarcodeScannedCommand.h"


@interface BarcodeScannedCommand ()
@property(nonatomic, strong) id <BarcodeScannedCommandHandler> handler;
@end

@implementation BarcodeScannedCommand

+ (instancetype)barcodeScannedWithBarcode:(NSString *)text andHandler:(id <BarcodeScannedCommandHandler>)handler {
  BarcodeScannedCommand *command = [BarcodeScannedCommand new];
  command.barcode = text;
  command.handler = handler;
  return command;
}

-(void) execute {
  [self.handler onBarcodeScanned:self.barcode];
}

@end