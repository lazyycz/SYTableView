//
//  SYTableViewHeaderFooterView.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableViewHeaderFooterView.h"

@interface SYTableViewHeaderFooterView ()

@property (nonatomic, assign) CGFloat viewHeihgt;
@property (nonatomic, strong) SYTableRow *tableRow;

@end

@implementation SYTableViewHeaderFooterView

+ (instancetype)initViewWithTableView:(UITableView *)tableView
                             viewName:(NSString *)name
{
    return [self initViewWithTableView:tableView viewName:name delegate:nil];
}

+ (instancetype)initViewWithTableView:(UITableView *)tableView
                             viewName:(NSString *)name
                             delegate:(__weak id)delegate
{
    if (!name.length) {
        return [SYTableViewHeaderFooterView initViewWithTableView:tableView];
    }
    
    SYTableViewHeaderFooterView *view = nil;
    
    Class viewClass = NSClassFromString(name);
    if ([viewClass isSubclassOfClass:[SYTableViewHeaderFooterView class]]) {
        view = [viewClass initViewWithTableView:tableView];
    } else {
        view = [SYTableViewHeaderFooterView initViewWithTableView:tableView];
    }
    
    view.delegate = delegate;
    
    return view;
}

+ (instancetype)initViewWithTableView:(UITableView *)tableView
{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    SYTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    if (!view) {
        view = [[self alloc] initWithReuseIdentifier:reuseIdentifier];
    }
    return view;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView { }

- (BOOL)reloadViewWithContent:(__kindof SYTableRow *)row
{
    if (!row ||
        ![row isKindOfClass:[SYTableRow class]] ||
        ![row isKindOfClass:[SYTableRow class]] ||
        !row.content) {
        return NO;
    }
    
    self.tableRow = row;
    self.viewHeihgt = row.rowHeihgt;
    
    return YES;
}

+ (CGFloat)viewHeightWithTableView:(UITableView *)tableView viewType:(SYTableViewHeaderFooterViewType)viewType tableRow:(SYTableRow *)tableRow;
{
    if (tableRow.rowHeihgt > 0) {
        return tableRow.rowHeihgt;
    }
    
    CGFloat height = CGFLOAT_MIN;
    
    // 根据内容自动适应cell的高度
    if ([tableRow autoAdjustCellHeight]) {
        SYTableViewHeaderFooterView *view = [SYTableViewHeaderFooterView initViewWithTableView:tableView viewName:tableRow.rowName];
        [view reloadViewWithContent:tableRow];
        
        UIView *layoutGuideView = view;
        
        [layoutGuideView setNeedsUpdateConstraints];
        [layoutGuideView updateConstraintsIfNeeded];
        
        layoutGuideView.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(layoutGuideView.bounds));
        
        [layoutGuideView setNeedsLayout];
        [layoutGuideView layoutIfNeeded];
        
        height = [((UITableViewHeaderFooterView *)layoutGuideView).contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        height += 1.0f;
    }
    else if (viewType == SYTableViewHeaderFooterViewTypeHeader) {
        if ([tableRow.delegate respondsToSelector:@selector(tableRowHeaderHeightWithContent:)]) {
            height = [tableRow.delegate tableRowHeaderHeightWithContent:tableRow.content];
        }
    }
    else if (viewType == SYTableViewHeaderFooterViewTypeFooter) {
        if ([tableRow.delegate respondsToSelector:@selector(tableRowFooterHeightWithContent:)]) {
            height = [tableRow.delegate tableRowFooterHeightWithContent:tableRow.content];
        }
    }
    
    return tableRow.rowHeihgt = height;
}

@end
