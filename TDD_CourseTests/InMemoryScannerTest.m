//
//  InMemoryScannerTest.m
//  TDD_Course
//
//  Created by Tommaso Resti on 05/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InMemoryScanner.h"
#import "FinishCommand.h"
#import "BarcodeScannedCommand.h"

@interface InMemoryScannerTest : XCTestCase

@end

@implementation InMemoryScannerTest

- (void)setUp {
    [super setUp];

}

- (void)test_barcode_scanned_command {
  NSArray *aBarcode = @[@"a_barcode"];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:aBarcode];
  XCTAssertTrue(scanner.hasNextCommand);
  Command *command = scanner.nextCommand;
  XCTAssertTrue([command isKindOfClass:[BarcodeScannedCommand class]]);
  BarcodeScannedCommand *barcodeScannedCommand = (BarcodeScannedCommand *) command;
  XCTAssertEqualObjects(barcodeScannedCommand.barcode, @"a_barcode");
}


- (void)test_finish_command {
  NSArray *noBarcodes = @[];
  InMemoryScanner *scanner = [InMemoryScanner scannerWithBarcodes:noBarcodes];
  XCTAssertTrue(scanner.hasNextCommand);
  XCTAssertTrue([scanner.nextCommand isKindOfClass:[FinishCommand class]]);
}

@end
