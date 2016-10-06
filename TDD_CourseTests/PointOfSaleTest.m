//
//  TDD_CourseTests.m
//  TDD_CourseTests
//
//  Created by Tommaso Resti on 04/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Scanner.h"
#import "OCMock.h"
#import "FinishCommand.h"
#import "PointOfSaleExecutor.h"
#import "TestInputProvider.h"
#import "BarcodeScannedOperation.h"
#import "FinishOperation.h"
#import "../TDD_Course/controllers/PointOfSaleController.h"

@interface PointOfSaleTest : XCTestCase
@end

@implementation PointOfSaleTest {

}

- (void)setUp {
  [super setUp];
}

- (void)test_a_scan {
  BarcodeScannedOperation *scannedOperation = OCMClassMock(BarcodeScannedOperation.class);
  FinishOperation *finishOperation = OCMClassMock(FinishOperation.class);
  PointOfSaleController *pointOfSale = [PointOfSaleController controllerWithScanOperation:scannedOperation andCheckoutOperation: finishOperation];
  BarcodeScannedCommand *scannedCommand = [BarcodeScannedCommand barcodeScannedWithBarcode:@"::a barcode::"];
  id<Input> inputProvider = [TestInputProvider providerWithCommands:@[scannedCommand]];
  PointOfSaleExecutor *executor = [PointOfSaleExecutor executorWithController:pointOfSale];

  [executor consume:inputProvider];

  OCMVerify([scannedOperation run:scannedCommand]);
}

- (void)test_a_checkout {
  BarcodeScannedOperation *scannedOperation = OCMClassMock(BarcodeScannedOperation.class);
  FinishOperation *finishOperation = OCMClassMock(FinishOperation.class);
  PointOfSaleController *pointOfSale = [PointOfSaleController controllerWithScanOperation:scannedOperation andCheckoutOperation: finishOperation];
  Command *finishCommand = [FinishCommand new];
  id<Input> inputProvider = [TestInputProvider providerWithCommands:@[finishCommand]];
  PointOfSaleExecutor *executor = [PointOfSaleExecutor executorWithController:pointOfSale];

  [executor consume:inputProvider];

  OCMVerify([finishOperation run:finishCommand]);
}

@end
