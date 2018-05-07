//
//  SYGoodsInfoTableViewHeaderView.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/7.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYGoodsInfoTableViewHeaderView.h"

@interface SYGoodsInfoTableViewHeaderView ()

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation SYGoodsInfoTableViewHeaderView

- (void)initView
{
    [super initView];
    
    [self addPageSubviews];
    [self makeConstraints];
}

- (void)addPageSubviews
{
    [self.contentView addSubview:({
        self.leftView = [UIView new];
        self.leftView.backgroundColor = [UIColor redColor];
        self.leftView;
    })];
    
    [self.contentView addSubview:({
        self.rightLabel = [UILabel labelWithTextFont:[UIFont H13Font] textColor:[UIColor blackColor]];
    })];
}

- (void)makeConstraints
{
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.top.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(-15);
        make.centerY.equalTo(self.leftView);
    }];
}

- (BOOL)reloadViewWithContent:(__kindof SYTableRow *)row
{
    if (![super reloadViewWithContent:row]) {
        return NO;
    }
    
    NSString *text = row.content;
    self.rightLabel.text = text;
    
    return YES;
}

@end
