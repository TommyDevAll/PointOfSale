//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scanner.h"

@class Controller;

@interface InMemoryScannerInput : NSObject <Scanner>
- (instancetype)initWithBarcodes:(NSArray *)barcodes;

+ (instancetype)scannerWithBarcodes:(NSArray *)barcodes;
@end