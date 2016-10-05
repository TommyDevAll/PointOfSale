//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "InMemoryScanner.h"
#import "BarcodeScannedCommand.h"
#import "FinishCommand.h"
#import "PointOfSale.h"


@interface InMemoryScanner ()
@property(nonatomic) NSMutableArray *lines;
@property(nonatomic) BOOL terminated;
@property(nonatomic, strong) id <BarcodeScannedCommandHandler> handler;
@end

@implementation InMemoryScanner
- (instancetype)initWithBarcodes:(NSArray *)barcodes andScanHandler:(id <BarcodeScannedCommandHandler>)handler {
  self = [super init];
  if (self) {
    self.lines = [barcodes mutableCopy];
    self.handler = handler;
  }
  return self;
}

+ (instancetype)scannerWithBarcodes:(NSArray *)barcodes andScanHandler:(id<BarcodeScannedCommandHandler>)handler {
  return [[self alloc] initWithBarcodes:barcodes andScanHandler:handler];
}

- (BOOL)hasNextCommand {
  return self.lines.count > 0 || !self.terminated;
}

- (Command *)nextCommand {
  Command *command;
  if(self.lines.count == 0) {
    self.terminated = TRUE;
    [self.handler onFinishCommand];
  }
  else {
    [self.handler onBarcodeScanned:self.lines[0]];
    [self.lines removeObjectAtIndex:0];
  }
  return command;
}

@end