//
//  SYStoreInfoTableViewHeaderView.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/7.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYStoreInfoTableViewHeaderView.h"

@interface SYStoreInfoTableViewHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SYStoreInfoTableViewHeaderView

- (void)initView
{
    [super initView];
    
    [self addPageSubviews];
    [self makeConstraints];
}

- (void)addPageSubviews
{
    [self.contentView addSubview:({
        self.titleLabel = [UILabel labelWithTextFont:[UIFont H13Font] textColor:[UIColor blackColor]];
        self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30.0f;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel;
    })];
}

- (void)makeConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(15.0f);
        make.bottom.right.mas_equalTo(-15.0f);
    }];
}

- (BOOL)reloadViewWithContent:(__kindof SYTableRow *)row
{
    if (![super reloadViewWithContent:row]) {
        return NO;
    }
    
    NSString *title = (NSString *)row.content;
    self.titleLabel.text = title;
    
    return YES;
}

@end
