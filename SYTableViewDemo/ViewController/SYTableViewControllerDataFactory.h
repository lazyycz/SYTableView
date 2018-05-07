//
//  SYTableViewControllerDataFactory.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYTableViewControllerRow.h"

@interface SYTableViewControllerDataFactory : NSObject

@property (nonatomic, strong, readonly) NSMutableArray <NSArray<SYTableViewControllerRow *> *> *cellRows;

- (void)handleData:(dispatch_block_t)complete;

- (SYTableViewControllerRow *)fetchCellRowWithIndexPath:(NSIndexPath *)indexPath;
- (SYTableViewControllerRow *)fetcheHeaderRowWithSection:(NSUInteger)section;

@end
