//
//  FinishOperationTest.m
//  TDD_Course
//
//  Created by Tommaso Resti on 06/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "../../../../../../../Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks/XCTest.framework/Headers/XCTest.h"
#import "FinishOperation.h"
#import "OCMock.h"
#import "Display.h"
#import "Cart.h"

@interface FinishOperationTest : XCTestCase

@end

@implementation FinishOperationTest

- (void)setUp {
    [super setUp];
}

- (void)test_finish {
  Cart *cart = OCMClassMock(Cart.class);
  id<Display> display = OCMProtocolMock(@protocol(Display));
  FinishOperation *operation = [FinishOperation operationWithCart:cart andDisplay:display];

  [OCMStub(cart.total) andReturnValue:OCMOCK_VALUE(1)];
  [operation run:nil];

  OCMVerify([display displayTotal:1];);
}

@end
