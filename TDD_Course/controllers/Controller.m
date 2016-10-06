//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import "Controller.h"
#import "Operation.h"
#import "BarcodeScannedOperation.h"

@interface Controller ()
@property(nonatomic, strong) NSMutableDictionary *operations;
@end

@implementation Controller

-(instancetype) init {
  if(self = [super init]) {
    self.operations = [@{} mutableCopy];
    [self registerOperations];
  }
  return self;
}

- (instancetype)initWithOperations:(NSDictionary *)operations {
  if(self = [self init]) {
    [self.operations addEntriesFromDictionary:operations];
  }
  return self;
}


#pragma mark - Controller

- (void)execute:(Command *)command {
  id<Operation> operation = self.operations[command.class];
  [operation run:command];
}

- (void) registerOperations {

}

- (void)registerOperation:(BarcodeScannedOperation *)operation forCommandType:(Class)type {
  if(operation && [type isSubclassOfClass:Command.class])
    [self.operations setObject:operation forKey:type];
}
@end