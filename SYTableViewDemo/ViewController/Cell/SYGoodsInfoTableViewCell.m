//
//  SYGoodsInfoTableViewCell.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/7.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYGoodsInfoTableViewCell.h"
#import "UIResponder+Router.h"

NSString * const kSYGoodsInfoTableViewCellLeftButtonClicked = @"SYGoodsInfoTableViewCellLeftButtonClicked";
NSString * const kSYGoodsInfoTableViewCellRightButtonClicked = @"SYGoodsInfoTableViewCellRightButtonClicked";

@interface SYGoodsInfoTableViewCell () <SYTableViewCellDelegate>

@property (nonatomic, strong) UIButton *leftView;
@property (nonatomic, strong) UIButton *rightView;

@end

@implementation SYGoodsInfoTableViewCell

- (void)addPageSubviews
{
    [self.contentView addSubview:({
        self.leftView = [UIButton new];
        self.leftView.backgroundColor = [UIColor redColor];
        [self.leftView addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.leftView;
    })];
    
    [self.contentView addSubview:({
        self.rightView = [UIButton new];
        self.rightView.backgroundColor = [UIColor greenColor];
        [self.rightView addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.rightView;
    })];
}

- (void)layoutPageSubviews
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

- (void)leftButtonClicked:(UIButton *)button
{
    [button routerEventWithName:kSYGoodsInfoTableViewCellLeftButtonClicked object:@{@"title" : @"leftButton"}];
}

- (void)rightButtonClicked:(UIButton *)button
{
    [button routerEventWithName:kSYGoodsInfoTableViewCellRightButtonClicked object:@{@"title" : @"rightButton"}];
}

@end
