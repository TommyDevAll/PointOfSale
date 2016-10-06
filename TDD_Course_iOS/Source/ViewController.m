//
//  ViewController.m
//  TDD_Course
//
//  Created by Tommaso Resti on 04/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "ViewController.h"
#import "PointOfSaleExecutor.h"
#import "PointOfSaleController.h"
#import "BarcodeScannedOperation.h"
#import "Cart.h"
#import "Display.h"
#import "FinishOperation.h"
#import "InMemoryCatalog.h"
#import "TestInputProvider.h"
#import "FinishCommand.h"

@interface ConsoleDisplay : NSObject <Display>
@end

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


@interface ViewController ()

@property(nonatomic, strong) PointOfSaleExecutor *executor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Cart *cart = [Cart cartWithPrices:@[]];
    id <Display> display = [ConsoleDisplay new];
    id <Catalog> catalog = [InMemoryCatalog catalogWithPrices:@{@"12345": [Item priceWithValue: 795]}];
    BarcodeScannedOperation *scanOperation = [BarcodeScannedOperation operationWithCatalog:catalog cart:cart andDisplay:display];
    FinishOperation *finishOperation = [FinishOperation operationWithCart:cart andDisplay:display];
    Controller *controller = [PointOfSaleController controllerWithScanOperation:scanOperation andCheckoutOperation:finishOperation];
    self.executor = [PointOfSaleExecutor executorWithController:controller];

    id <Input> provider = [TestInputProvider providerWithCommands:@[
        [BarcodeScannedCommand barcodeScannedWithBarcode:@"12345"],
        [FinishCommand new]
    ]];
    [self.executor consume:provider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end