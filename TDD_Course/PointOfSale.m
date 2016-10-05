//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "PointOfSale.h"
#import "Display.h"
#import "Catalog.h"
#import "FinishCommand.h"
#import "Scanner.h"
#import "Cart.h"
#import "BarcodeScannedCommand.h"


@interface PointOfSale ()
@property(nonatomic, strong) id catalog;
@property(nonatomic, strong) id display;
@property(nonatomic, strong) Cart *cart;
@end

@implementation PointOfSale
+ (PointOfSale *)pointOfSaleWithCatalog:(id)catalog andDisplay:(id)display {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.catalog = catalog;
  sale.display = display;
  sale.cart = [Cart cartWithPrices:@[]];
  return sale;
}

+ (PointOfSale *)pointOfSaleWithCatalog:(id <Catalog>)catalog andDisplay:(id <Display>)display andCart:(Cart *)cart {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.catalog = catalog;
  sale.display = display;
  sale.cart = cart;
  return sale;
}

- (void)executeScannerCommand:(BarcodeScannedCommand *)command {
  Price *price = [self.catalog findPrice:command.barcode];
  if(price) {
    [self priceFound:price];
  }
  else
    [self.display displayPriceNotFound];
}

- (void)priceFound:(Price *)price {
  [self.cart addPrice:price];
  [self.display displayPriceFound:price];
}

-(void)executeFinishCommand:(FinishCommand *)command {
  [self.display displayTotal:self.cart.total];
}

- (void)execute:(Command *)command {
  if([command isKindOfClass:[FinishCommand class]]) {
    [self executeFinishCommand:(FinishCommand *) command];
  }
  else if([command isKindOfClass:[BarcodeScannedCommand class]]) {
    [self executeScannerCommand:(BarcodeScannedCommand *) command];
  }
}

@end