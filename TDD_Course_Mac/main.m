//
//  main.m
//  TDD_Course_Mac
//
//  Created by Tommaso Resti on 05/10/16.
//  Copyright © 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FinishCommand.h"
#import "BarcodeScannedCommand.h"
#import "TestInputProvider.h"
#import "Executor.h"
#import "PointOfSaleController.h"
#import "FinishOperation.h"
#import "BarcodeScannedOperation.h"
#import "Item.h"
#import "InMemoryCatalog.h"
#import "Cart.h"
#import "Display.h"

@interface ConsoleDisplay : NSObject <Display>
@end

void runPointOfSale();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        runPointOfSale();
    }
    return 0;
}

void runPointOfSale() {
  Cart *cart = [Cart cartWithPrices:@[]];
  id <Display> display = [ConsoleDisplay new];
  id <Catalog> catalog = [InMemoryCatalog catalogWithPrices:@{@"12345": [Item priceWithValue: 795]}];
  BarcodeScannedOperation *scanOperation = [BarcodeScannedOperation operationWithCatalog:catalog cart:cart andDisplay:display];
  FinishOperation *finishOperation = [FinishOperation operationWithCart:cart andDisplay:display];
  Controller *controller = [PointOfSaleController controllerWithScanOperation:scanOperation andCheckoutOperation:finishOperation];
  Executor *executor = [Executor executorWithController:controller];

  id <Input> provider = [TestInputProvider providerWithCommands:@[
      [BarcodeScannedCommand barcodeScannedWithBarcode:@"12345"],
      [FinishCommand new]
  ]];
  [executor consume:provider];
}

@implementation ConsoleDisplay
- (void)displayItemFound:(const Item *)item {
  NSLog(@"Item found: %.2f", item.cents / 100.f);
}

- (void)displayItemNotFound {
  NSLog(@"Item not found");
}

- (void)displayTotal: (int)total {
  NSLog(@"Total: %.2f", total / 100.f);
}

@end

