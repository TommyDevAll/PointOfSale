//
// Created by Tommaso Resti on 06/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "PointOfSaleController.h"
#import "BarcodeScannedOperation.h"
#import "FinishOperation.h"
#import "FinishCommand.h"


@interface PointOfSaleController ()
@property(nonatomic, strong) BarcodeScannedOperation *scannedOperation;
@property(nonatomic, strong) FinishOperation *finishOperation;
@end

@implementation PointOfSaleController {

}
+ (PointOfSaleController *)controllerWithScanOperation:(BarcodeScannedOperation *)scannedOperation andCheckoutOperation:(FinishOperation *)finishOperation {
  PointOfSaleController *controller = [PointOfSaleController alloc];
  controller.scannedOperation = scannedOperation;
  controller.finishOperation = finishOperation;
  [controller init];
  return controller;
}

- (void)registerOperations {
  [self registerOperation:self.scannedOperation forCommandType:BarcodeScannedCommand.class];
  [self registerOperation:self.finishOperation forCommandType:FinishCommand.class];
}

@end