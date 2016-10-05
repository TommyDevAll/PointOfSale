//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "BarcodeScannedOperation.h"
#import "Cart.h"
#import "Catalog.h"
#import "Display.h"
#import "BarcodeScannedCommand.h"

@implementation BarcodeScannedOperation
- (void)run:(Command *)command {
  [self onBarcodeScanned:(BarcodeScannedCommand *) command];
}

+ (id)operationWithCatalog:(id)catalog cart:(Cart *)cart andDisplay:(id)display {
  BarcodeScannedOperation *operation = [BarcodeScannedOperation new];
  operation.display = display;
  operation.cart = cart;
  operation.catalog = catalog;
  return operation;
}

- (void)onBarcodeScanned:(BarcodeScannedCommand *)command {
  Price *price = [self.catalog findPrice:command.barcode];
  if(price)
    [self priceFound:price];
  else
    [self.display displayPriceNotFound];
}

- (void)priceFound:(Price *)price {
  [self.cart addPrice:price];
  [self.display displayPriceFound:price];
}

@end