//
// Created by Tommaso Resti on 05/10/16.
// Copyright (c) 2016 Tommaso Resti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Command;

@protocol Input <NSObject>
- (BOOL)hasNextCommand;
- (Command *)nextCommand;
@end