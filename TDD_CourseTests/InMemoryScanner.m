//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "InMemoryScanner.h"
#import "BarcodeScannedCommand.h"
#import "FinishCommand.h"
#import "PointOfSale.h"


@interface InMemoryScanner ()
@property(nonatomic) NSMutableArray *barcodes;
@property(nonatomic) BOOL terminated;
@property(nonatomic, strong) id <BarcodeScannedCommandHandler> handler;
@end

@implementation InMemoryScanner
- (instancetype)initWithBarcodes:(NSArray *)barcodes andScanHandler:(id <BarcodeScannedCommandHandler>)handler {
  self = [super init];
  if (self) {
    self.barcodes = [barcodes mutableCopy];
    self.handler = handler;
  }
  return self;
}

+ (instancetype)scannerWithBarcodes:(NSArray *)barcodes andScanHandler:(id<BarcodeScannedCommandHandler>)handler {
  return [[self alloc] initWithBarcodes:barcodes andScanHandler:handler];
}

- (BOOL)hasNextCommand {
  return self.barcodes.count > 0 || !self.terminated;
}

- (Command *)nextCommand {
  Command *command;
  if(self.barcodes.count == 0) {
    self.terminated = TRUE;
    command = [FinishCommand commandWithHandler:self.handler];
  }
  else {
    command = [BarcodeScannedCommand barcodeScannedWithBarcode:self.barcodes[0] andHandler:self.handler];
    [self.barcodes removeObjectAtIndex:0];
  }
  return command;
}

@end