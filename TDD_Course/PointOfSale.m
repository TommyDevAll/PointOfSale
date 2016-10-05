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

@interface FinishOperation: NSObject <Operation>
@property (weak) id<Display> display;
@property (weak) Cart *cart;

+ (id)operationWithCart:(Cart *)cart andDisplay:(id)display;
@end

@implementation FinishOperation
- (void)run:(Command *)command {
  [self.display displayTotal:self.cart.total];
}

+ (id)operationWithCart:(Cart *)cart andDisplay:(id)display {
  FinishOperation *operation = [FinishOperation new];
  operation.cart = cart;
  operation.display = display;
  return operation;
}
@end

@interface BarcodeScannedOperation : NSObject <Operation>
@property (weak) id<Display> display;
@property (weak) id<Catalog> catalog;
@property (weak) Cart *cart;

+ (id)operationWithCatalog:(id)catalog cart:(Cart *)cart andDisplay:(id)display;
@end

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