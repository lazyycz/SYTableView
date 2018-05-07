//
//  SYGoodsInfoTableViewCell.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/7.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYGoodsInfoTableViewCell.h"

@interface SYGoodsInfoTableViewCell ()

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;

@end

@implementation SYGoodsInfoTableViewCell

- (void)initCell
{
    [super initCell];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
        self.rightView = [UIView new];
        self.rightView.backgroundColor = [UIColor greenColor];
        self.rightView;
    })];
}

- (void)makeConstraints
{
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.rightView);
        make.top.left.mas_equalTo(15);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.leftView);
        make.left.equalTo(self.leftView.mas_right).offset(10);
        make.right.mas_equalTo(-15);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
