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
+ (id)operationWithCatalog:(id)catalog cart:(Cart *)cart andDisplay:(id)display {
  BarcodeScannedOperation *operation = [BarcodeScannedOperation new];
  operation.display = display;
  operation.cart = cart;
  operation.catalog = catalog;
  return operation;
}

- (void)run:(Command *)command {
  Price *price = [self.catalog findPrice:((BarcodeScannedCommand *) command).barcode];
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