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
+ (id)operationWithCatalog:(id)catalog cart:(Cart *)cart andDisplay:(id<Display>)display {
  BarcodeScannedOperation *operation = [BarcodeScannedOperation new];
  operation.display = display;
  operation.cart = cart;
  operation.catalog = catalog;
  return operation;
}

- (void)run:(Command *)command {
  Item *price = [self.catalog findPrice:((BarcodeScannedCommand *) command).barcode];
  if(price)
    [self priceFound:price];
  else
    [self.display displayItemNotFound];
}

- (void)priceFound:(Item *)price {
  [self.cart addPrice:price];
  [self.display displayItemFound:price];
}

@end