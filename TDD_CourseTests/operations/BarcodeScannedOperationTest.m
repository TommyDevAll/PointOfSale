//
//  BarcodeScannedOperationTest.m
//  TDD_Course
//
//  Created by Tommaso Resti on 06/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Display.h"
#import "Catalog.h"
#import "OCMock.h"
#import "BarcodeScannedOperation.h"
#import "Cart.h"
#import "BarcodeScannedCommand.h"


@interface BarcodeScannedOperationTest : XCTestCase
@property id<Catalog> catalog;
@property id<Display> display;
@end

@implementation BarcodeScannedOperationTest {
  NSString *A_BARCODE;
  NSString *NOT_EXISTENT_BARCODE;
  Item *A_PRICE;
}

- (void)setUp {
  [super setUp];
  A_BARCODE = @"A_BARCODE";
  NOT_EXISTENT_BARCODE = @"NOT_EXISTENT_BARCODE";
  A_PRICE = [[Item alloc] init];

  self.catalog = OCMProtocolMock(@protocol(Catalog));
  self.display = OCMProtocolMock(@protocol(Display));
}

- (void)test_given_a_valid_barcode {
  Cart *cart = [Cart new];
  BarcodeScannedOperation *operation = [BarcodeScannedOperation operationWithCatalog:_catalog cart:cart andDisplay:_display];
  BarcodeScannedCommand *command = [BarcodeScannedCommand barcodeScannedWithBarcode:A_BARCODE];

  [OCMStub([_catalog findPrice:A_BARCODE]) andReturn:A_PRICE];
  [operation run:command];

  OCMVerify([_display displayItemFound:A_PRICE];);
}

- (void)test_given_a_not_existent_barcode {
  Cart *cart = [Cart new];
  BarcodeScannedOperation *operation = [BarcodeScannedOperation operationWithCatalog:_catalog cart:cart andDisplay:_display];
  BarcodeScannedCommand *command = [BarcodeScannedCommand barcodeScannedWithBarcode:NOT_EXISTENT_BARCODE];

  [OCMStub([_catalog findPrice:NOT_EXISTENT_BARCODE]) andReturn:nil];
  [operation run:command];

  OCMVerify([_display displayItemNotFound];);
}

@end
