//
//  STStoreInfoTableViewCell.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYStoreInfoTableViewCell.h"

@implementation SYStoreInfoTableViewCellModel

@end

@interface SYStoreInfoTableViewCell ()

@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation SYStoreInfoTableViewCell

- (void)initCell
{
    [super initCell];
    [self addPageSubviews];
    [self makeConstraints];
}

- (void)addPageSubviews
{
    [self.contentView addSubview:({
        self.descLabel = [UILabel labelWithTextFont:[UIFont H15Font] textColor:[UIColor blackColor] backgroundColor:[UIColor lightTextColor]];
        self.descLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30.0f;
        self.descLabel.numberOfLines = 0;
        self.descLabel;
    })];
}

- (void)makeConstraints
{
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.right.mas_lessThanOrEqualTo(-15);
    }];
}

- (BOOL)reloadCellWithContent:(__kindof SYTableRow *)row
{
    if (![super reloadCellWithContent:row]) {
        return NO;
    }
    
    SYStoreInfoTableViewCellModel *cellModel = row.content;
    
    self.descLabel.text = cellModel.descText;
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
