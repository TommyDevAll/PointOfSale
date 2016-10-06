//
//  TDD_CourseTests.m
//  TDD_CourseTests
//
//  Created by Tommaso Resti on 04/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Controller.h"
#import "Catalog.h"
#import "Display.h"
#import "Scanner.h"
#import "OCMock.h"
#import "InMemoryScannerInput.h"
#import "FinishCommand.h"
#import "Cart.h"
#import "PointOfSaleExecutor.h"
#import "TestInputProvider.h"
#import "BarcodeScannedOperation.h"
#import "FinishOperation.h"
#import "../TDD_Course/controllers/PointOfSaleController.h"

@interface PointOfSaleTest : XCTestCase
@property id<Catalog> catalog;
@property id<Display> display;
@end

@implementation PointOfSaleTest {
  NSString *A_BARCODE;
  NSString *NOT_EXISTENT_BARCODE;
  Price *A_PRICE;
}

- (void)setUp {
  [super setUp];
  A_BARCODE = @"A_BARCODE";
  NOT_EXISTENT_BARCODE = @"NOT_EXISTENT_BARCODE";
  A_PRICE = [[Price alloc] init];

  self.catalog = OCMProtocolMock(@protocol(Catalog));
  self.display = OCMProtocolMock(@protocol(Display));
}

- (void)test_a_scan {
  BarcodeScannedOperation *scannedOperation = OCMClassMock(BarcodeScannedOperation.class);
  FinishOperation *finishOperation = OCMClassMock(FinishOperation.class);
  PointOfSaleController *pointOfSale = [PointOfSaleController controllerWithScanOperation:scannedOperation andCheckoutOperation: finishOperation];
  BarcodeScannedCommand *scannedCommand = [BarcodeScannedCommand barcodeScannedWithBarcode:@"::a barcode::"];
  id<Input> inputProvider = [TestInputProvider providerWithCommands:@[scannedCommand]];
  PointOfSaleExecutor *executor = [PointOfSaleExecutor executorWithOperationRouter:pointOfSale];

  [executor consume:inputProvider];

  OCMVerify([scannedOperation run:scannedCommand]);
}

- (void)test_a_checkout {
  BarcodeScannedOperation *scannedOperation = OCMClassMock(BarcodeScannedOperation.class);
  FinishOperation *finishOperation = OCMClassMock(FinishOperation.class);
  PointOfSaleController *pointOfSale = [PointOfSaleController controllerWithScanOperation:scannedOperation andCheckoutOperation: finishOperation];
  Command *finishCommand = [FinishCommand new];
  id<Input> inputProvider = [TestInputProvider providerWithCommands:@[finishCommand]];
  PointOfSaleExecutor *executor = [PointOfSaleExecutor executorWithOperationRouter:pointOfSale];

  [executor consume:inputProvider];

  OCMVerify([finishOperation run:finishCommand]);
}

@end
