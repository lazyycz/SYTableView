//
//  SYTableViewControllerDataFactory.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableViewControllerDataFactory.h"

#import "SYStoreInfoTableViewCell.h"

@interface SYTableViewControllerDataFactory ()

@property (nonatomic, strong) NSMutableArray <NSArray<SYTableViewControllerRow *> *> *cellRows;
@property (nonatomic, strong) NSMutableArray <SYTableViewControllerRow *> *headerRows;

@end

@implementation SYTableViewControllerDataFactory

- (instancetype)init
{
    if (self = [super init]) {
        _cellRows = @[].mutableCopy;
        _headerRows = @[].mutableCopy;
    }
    return self;
}

- (void)handleData:(dispatch_block_t)complete
{
    [self goodsInfoData];
    [self storeInfoData];
    
    !complete ? : complete();
}

- (void)storeInfoData
{
    SYStoreInfoTableViewCellModel *cellModel = [SYStoreInfoTableViewCellModel new];
    cellModel.descText = @"New York State Route 343 (NY 343) is a state highway in Dutchess County, in the Hudson Valley of the U.S. state of New York. It runs east–west from the intersection of NY 82 in the village of Millbrook to the Connecticut state line in the hamlet of Amenia, where Connecticut Route 343 continues briefly eastward. It was originally the Dover branch of the Dutchess Turnpike, a 19th-century transportation route between Litchfield County, Connecticut, and the city of Poughkeepsie. NY 343 was designated in 1930, connecting Amenia to the state line, but was relocated a few years later onto the portion of NY 200 from South Millbrook to the hamlet of Dover Plains. Landmarks along the way include the Silo Ridge Country Club in the hamlet of Wassaic, Beekman Park in Amenia, and the Troutbeck ";
    
    SYStoreInfoTableViewCellModel *cellModel1 = [SYStoreInfoTableViewCellModel new];
    cellModel1.descText = @"Conference Center in the hamlet of Leedsville. Connecticut Route 343 passes through more rural and residential areas into the town of Sharon, Connecticut, where it terminates at a junction with Route 4 and Route 41. (Full article...)";
    
    SYTableViewControllerRow *row = [[SYTableViewControllerRow alloc] initWithRowContent:cellModel rowName:@"SYStoreInfoTableViewCell" rowTag:SYTableViewControllerRowTypeStoreInfo];
    row.autoAdjustCellHeight = YES;
    
    SYTableViewControllerRow *row1 = [[SYTableViewControllerRow alloc] initWithRowContent:cellModel1 rowName:@"SYStoreInfoTableViewCell" rowTag:SYTableViewControllerRowTypeStoreInfo];
    row1.autoAdjustCellHeight = YES;
    
    [self.cellRows addObject:@[row, row1, row, row, row1, row1]];
    
    SYTableViewControllerRow *headerRow = [[SYTableViewControllerRow alloc] initWithRowContent:@"New York State Route 343 (NY 343) is a state highway in Dutchess County, in the Hudson Valley of the U.S. state of New York" rowName:@"SYStoreInfoTableViewHeaderView" rowTag:SYTableViewControllerRowTypeStoreInfo];
    headerRow.autoAdjustCellHeight = YES;
    [self.headerRows addObject:headerRow];
}

- (void)goodsInfoData
{
    SYTableViewControllerRow *row = [[SYTableViewControllerRow alloc] initWithRowContent:@"" rowName:@"SYGoodsInfoTableViewCell" rowTag:SYTableViewControllerRowTypeGoodsInfo];
    [self.cellRows addObject:@[row]];
    
    SYTableViewControllerRow *headerRow = [[SYTableViewControllerRow alloc] initWithRowContent:@"New York State Route 343 (NY 343)" rowName:@"SYGoodsInfoTableViewHeaderView" rowTag:SYTableViewControllerRowTypeGoodsInfo];
    headerRow.autoAdjustCellHeight = YES;
    [self.headerRows addObject:headerRow];
}

- (SYTableViewControllerRow *)fetchCellRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section >= self.cellRows.count) return [SYTableViewControllerRow new];
    if (indexPath.row >= self.cellRows[indexPath.section].count) return [SYTableViewControllerRow new];
    return self.cellRows[indexPath.section][indexPath.row];
}

- (SYTableViewControllerRow *)fetcheHeaderRowWithSection:(NSUInteger)section
{
    if (section >= self.headerRows.count) return [SYTableViewControllerRow new];
    return self.headerRows[section];
}

@end
