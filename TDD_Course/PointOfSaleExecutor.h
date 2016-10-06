//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Input;
@class Controller;


@interface PointOfSaleExecutor : NSObject
- (instancetype)initWithController:(Controller *)controller;

+ (instancetype)executorWithOperationRouter:(Controller *)controller;

- (void)consume:(id<Input>)input;
@end