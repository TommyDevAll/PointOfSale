//
//  TDD_CourseTests.m
//  TDD_CourseTests
//
//  Created by Tommaso Resti on 04/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PointOfSale.h"
#import "Catalog.h"
#import "Display.h"
#import "Scanner.h"
#import "OCMock.h"
#import "Price.h"
#import "InMemoryScanner.h"
#import "Command.h"
#import "FinishCommand.h"
#import "Total.h"
#import "CommandExecutor.h"

@interface PointOfSaleTest : XCTestCase
@property id<Catalog> catalog;
@property id<Display> display;
@end

@implementation PointOfSaleTest {
  NSString *A_BARCODE;
  NSString *ANOTHER_BARCODE;
  NSString *NOT_EXISTENT_BARCODE;
  Price *A_PRICE;
}

- (void)setUp {
  [super setUp];
  A_BARCODE = @"A_BARCODE";
  ANOTHER_BARCODE = @"ANOTHER_BARCODE";
  NOT_EXISTENT_BARCODE = @"NOT_EXISTENT_BARCODE";
  A_PRICE = [[Price alloc] init];

  self.catalog = OCMProtocolMock(@protocol(Catalog));
  self.display = OCMProtocolMock(@protocol(Display));
}

- (void)test_a_price_found {
  PointOfSale *pointOfSale = [PointOfSale pointOfSaleWithCatalog:self.catalog andDisplay:self.display];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:@[A_BARCODE]];
  CommandExecutor *executor = [CommandExecutor executorWithController:pointOfSale];

  [OCMStub([self.catalog findPrice: A_PRICE]) andReturn:nil];
  [executor consume:scanner];

  OCMVerify([self.display displayPriceNotFound]);
}

- (void)test_a_price_not_found {
  PointOfSale *pointOfSale = [PointOfSale pointOfSaleWithCatalog:self.catalog andDisplay:self.display];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:@[NOT_EXISTENT_BARCODE]];
  CommandExecutor *executor = [CommandExecutor executorWithController:pointOfSale];

  [OCMStub([self.catalog findPrice: NOT_EXISTENT_BARCODE]) andReturn:nil];
  [executor consume:scanner];

  OCMVerify([self.display displayPriceNotFound]);
}

- (void)test_total {

  PointOfSale *pointOfSale = [PointOfSale pointOfSaleWithCatalog:self.catalog andDisplay:self.display];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:@[]];
  CommandExecutor *executor = [CommandExecutor executorWithController:pointOfSale];

  [executor consume:scanner];

  OCMVerify([self.display displayTotal: [Total totalWithPrices:@[]]]);
}

-(void)test_command_executor {
  PointOfSale *pointOfSale = [PointOfSale pointOfSaleWithCatalog:self.catalog andDisplay:self.display];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:@[NOT_EXISTENT_BARCODE]];
  CommandExecutor *executor = [CommandExecutor executorWithController:pointOfSale];
  [executor consume: scanner];
}


@end
