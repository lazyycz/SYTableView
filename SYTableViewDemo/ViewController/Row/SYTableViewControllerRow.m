//
//  SYTableViewControllerRow.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableViewControllerRow.h"

@implementation SYTableViewControllerRow

- (CGFloat)tableRowCellHeightWithContent:(id)content
{
    CGFloat height = CGFLOAT_MIN;
    
    switch (self.rowTag) {
        case SYTableViewControllerRowTypeGoodsInfo:
            height = 80.0f;
            break;
            
        default:
            break;
    }
    
    return height;
}

- (CGFloat)tableRowHeaderHeightWithContent:(id)content
{
    CGFloat height = CGFLOAT_MIN;

    return height;
}

- (CGFloat)tableRowFooterHeightWithContent:(id)content
{
    CGFloat height = CGFLOAT_MIN;

    return height;
}

@end
