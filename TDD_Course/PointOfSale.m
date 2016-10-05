//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "PointOfSale.h"
#import "Display.h"
#import "Catalog.h"
#import "FinishCommand.h"
#import "Scanner.h"
#import "Total.h"
#import "BarcodeScannedCommand.h"


@interface PointOfSale ()
@property(nonatomic, strong) id catalog;
@property(nonatomic, strong) id display;
@property(nonatomic, strong) Total *total;
@end

@implementation PointOfSale
+ (PointOfSale *)pointOfSaleWithCatalog:(id)catalog andDisplay:(id)display {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.catalog = catalog;
  sale.display = display;
  sale.total = [Total totalWithPrices:@[]];
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
  [self.total addPrice:price];
  [self.display displayPriceFound:price];
}

-(void)executeFinishCommand:(FinishCommand *)command {
  [self.display displayTotal:self.total];
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