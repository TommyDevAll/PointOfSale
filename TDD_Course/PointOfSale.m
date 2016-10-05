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
#import "Operation.h"
#import "FinishOperation.h"
#import "BarcodeScannedOperation.h"

@interface PointOfSale ()
@property(nonatomic, strong) id catalog;
@property(nonatomic, strong) id display;
@property(nonatomic, strong) Cart *cart;
@property(nonatomic, strong) NSDictionary *operations;
@end

@implementation PointOfSale
+ (PointOfSale *)pointOfSaleWithCatalog:(id)catalog andDisplay:(id)display {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.catalog = catalog;
  sale.display = display;
  sale.cart = [Cart cartWithPrices:@[]];
  [sale createOperations];
  return sale;
}

+ (PointOfSale *)pointOfSaleWithCatalog:(id <Catalog>)catalog andDisplay:(id <Display>)display andCart:(Cart *)cart {
  PointOfSale *sale = [[PointOfSale alloc] init];
  sale.catalog = catalog;
  sale.display = display;
  sale.cart = cart;
  [sale createOperations];
  return sale;
}

-(void) createOperations {
  self.operations = @{
      FinishCommand.class: [FinishOperation operationWithCart: self.cart andDisplay: self.display],
      BarcodeScannedCommand.class: [BarcodeScannedOperation operationWithCatalog:self.catalog cart: self.cart andDisplay:self.display]
  };
}

#pragma mark - Controller

- (void)execute:(Command *)command {
  [self.operations[command.class] run: command];

}

@end