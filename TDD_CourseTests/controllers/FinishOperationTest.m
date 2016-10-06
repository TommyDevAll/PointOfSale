//
//  FinishOperationTest.m
//  TDD_Course
//
//  Created by Tommaso Resti on 06/10/16.
//  Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <XCTest/XCTest.h>
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

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
