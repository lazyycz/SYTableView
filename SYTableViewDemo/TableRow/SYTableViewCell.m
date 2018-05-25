//
//  SYTableViewCell.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableViewCell.h"

@interface SYTableViewCell ()

@property (nonatomic, assign) CGFloat cellHeihgt;
@property (nonatomic, strong) SYTableRow *tableRow;

@end

@implementation SYTableViewCell

+ (instancetype)initCellWithTableView:(UITableView *)tableView cellName:(NSString *)name
{
    return [self initCellWithTableView:tableView cellName:name delegate:nil];
}

+ (instancetype)initCellWithTableView:(UITableView *)tableView cellName:(NSString *)name delegate:(__weak id)delegate
{
    if (!name.length) {
        return [SYTableViewCell initCellWithTableView:tableView];
    }

    SYTableViewCell *cell = nil;

    Class cellClass = NSClassFromString(name);
    if (cellClass && [cellClass isSubclassOfClass:[SYTableViewCell class]]) {
        cell = [cellClass initCellWithTableView:tableView];
    } else {
        cell = [SYTableViewCell initCellWithTableView:tableView];
    }
    
    cell.delegate = delegate;
    
    return cell;
}

+ (instancetype)initCellWithTableView:(UITableView *)tableView
{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    SYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupDelegata];
    }
    return self;
}

- (void)setupDelegata
{
    if ([self conformsToProtocol:@protocol(SYTableViewCellDelegate)]) {
        __weak typeof((id <SYTableViewCellDelegate>) self) delegate = (id <SYTableViewCellDelegate>)self;
        if ([delegate respondsToSelector:@selector(setupPageView)]) {
            [delegate setupPageView];
        }
        if ([delegate respondsToSelector:@selector(addPageSubviews)]) {
            [delegate addPageSubviews];
        }
        if ([delegate respondsToSelector:@selector(layoutPageSubviews)]) {
            [delegate layoutPageSubviews];
        }
    }
}

- (BOOL)reloadCellWithContent:(__kindof SYTableRow *)row
{
    if (!row ||
        ![row isKindOfClass:[SYTableRow class]] ||
        ![row isKindOfClass:[SYTableRow class]] ||
        !row.content) {
        return NO;
    }
    
    self.tableRow = row;
    self.cellHeihgt = row.rowHeihgt;
    
    return YES;
}

+ (CGFloat)cellHeightWithTableView:(UITableView *)tableView tableRow:(SYTableRow *)tableRow;
{
    if (tableRow.rowHeihgt > 0) {
        return tableRow.rowHeihgt;
    }
    
    CGFloat height = CGFLOAT_MIN;
    
    // 根据内容自动适应cell的高度
    if ([tableRow autoAdjustRowHeight]) {
        SYTableViewCell *cell = [SYTableViewCell initCellWithTableView:tableView cellName:tableRow.rowName];
        [cell reloadCellWithContent:tableRow];
        
        UIView *layoutGuideView = cell;
        
        [layoutGuideView setNeedsUpdateConstraints];
        [layoutGuideView updateConstraintsIfNeeded];
        
        layoutGuideView.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(layoutGuideView.bounds));
        
        [layoutGuideView setNeedsLayout];
        [layoutGuideView layoutIfNeeded];
        
        height = [((UITableViewCell *)layoutGuideView).contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        height += 1.0f;
    }
    else if (tableRow.delegate && [tableRow.delegate respondsToSelector:@selector(tableRowCellHeightWithContent:)]) {
        height = [tableRow.delegate tableRowCellHeightWithContent:tableRow.content];
    }
    
    return tableRow.rowHeihgt = height;
}

@end
