//
//  BarcodeScannedCommandTest.m
//  TDD_Course
//
//  Created by Tommaso Resti on 06/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BarcodeScannedCommand.h"

@interface BarcodeScannedCommandTest : XCTestCase

@end

@implementation BarcodeScannedCommandTest

- (void)test_barcode_value {
  BarcodeScannedCommand *command = [BarcodeScannedCommand barcodeScannedWithBarcode:@"::a barcode::"];
  XCTAssertEqualObjects(@"::a barcode::", command.barcode);
}

@end
