//
//  SYTableViewHeaderFooterView.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableRow.h"

typedef NS_ENUM(NSInteger, SYTableViewHeaderFooterViewType) {
    SYTableViewHeaderFooterViewTypeHeader       = 0,
    SYTableViewHeaderFooterViewTypeFooter,
};

@interface SYTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, assign, readonly) CGFloat viewHeihgt;
@property (nonatomic, strong, readonly) SYTableRow *tableRow;

@property (nonatomic, weak) id delegate;

+ (instancetype)initViewWithTableView:(UITableView *)tableView
                             viewName:(NSString *)name;

+ (instancetype)initViewWithTableView:(UITableView *)tableView
                             viewName:(NSString *)name
                             delegate:(__weak id)delegate;

- (void)initView;
- (BOOL)reloadViewWithContent:(__kindof SYTableRow *)row;

+ (CGFloat)viewHeightWithTableView:(UITableView *)tableView viewType:(SYTableViewHeaderFooterViewType)viewType tableRow:(SYTableRow *)tableRow;

@end
