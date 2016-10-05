//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "InMemoryScannerInput.h"
#import "BarcodeScannedCommand.h"
#import "FinishCommand.h"
#import "PointOfSale.h"


@interface InMemoryScannerInput ()
@property(nonatomic) NSMutableArray *barcodes;
@property(nonatomic) BOOL terminated;
@end

@implementation InMemoryScannerInput
- (instancetype)initWithBarcodes:(NSArray *)barcodes {
  self = [super init];
  if (self) {
    self.barcodes = [barcodes mutableCopy];
  }
  return self;
}

+ (instancetype)scannerWithBarcodes:(NSArray *)barcodes {
  return [[self alloc] initWithBarcodes:barcodes];
}

- (BOOL)hasNextCommand {
  return self.barcodes.count > 0 || !self.terminated;
}

- (Command *)nextCommand {
  Command *command;
  if(self.barcodes.count == 0) {
    self.terminated = TRUE;
    command = [FinishCommand new];
  }
  else {
    command = [BarcodeScannedCommand barcodeScannedWithBarcode:self.barcodes[0]];
    [self.barcodes removeObjectAtIndex:0];
  }
  return command;
}

@end