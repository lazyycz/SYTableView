//
//  SYTableViewCell.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableRow.h"

@interface SYTableViewCell : UITableViewCell

@property (nonatomic, assign, readonly) CGFloat cellHeihgt;
@property (nonatomic, strong, readonly) SYTableRow *tableRow;

@property (nonatomic, weak) id delegate;

+ (instancetype)initCellWithTableView:(UITableView *)tableView cellName:(NSString *)name;
+ (instancetype)initCellWithTableView:(UITableView *)tableView cellName:(NSString *)name delegate:(__weak id)delegate;

- (void)initCell;
- (BOOL)reloadCellWithContent:(__kindof SYTableRow *)row;

+ (CGFloat)cellHeightWithTableView:(UITableView *)tableView tableRow:(SYTableRow *)tableRow;

@end
