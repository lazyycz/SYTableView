//
//  SYTableViewControllerRow.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableRow.h"

typedef NS_ENUM(NSInteger, SYTableViewControllerRowType) {
    SYTableViewControllerRowTypeStoreInfo       = 1,
    SYTableViewControllerRowTypeGoodsInfo,
};

@interface SYTableViewControllerRow : SYTableRow <SYTableRowHeihgtDelegate>

@end
