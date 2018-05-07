//
//  UIButton+Utility.m
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "UIButton+Utility.h"

@implementation UIButton (Utility)

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color
{
    return [UIButton buttonWithTitleFont:font titleColor:color title:nil backgroundColor:nil];
}

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title
{
    return [UIButton buttonWithTitleFont:font titleColor:color title:title backgroundColor:nil];
}

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [UIButton buttonWithTitleFont:font titleColor:color title:nil backgroundColor:backColor];
}

+ (UIButton *)buttonWithTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title backgroundColor:(UIColor *)backColor
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitleFont:font titleColor:color title:title backgroundColor:backColor];
    return button;
}


+ (UIButton *)buttonWithFrame:(CGRect)frame titleFont:(UIFont *)font titleColor:(UIColor *)color
{
    return [UIButton buttonWithFrame:frame titleFont:font titleColor:color title:nil backgroundColor:nil];
}

+ (UIButton *)buttonWithFrame:(CGRect)frame titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title
{
    return [UIButton buttonWithFrame:frame titleFont:font titleColor:color title:title backgroundColor:nil];
}

+ (UIButton *)buttonWithFrame:(CGRect)frame titleFont:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [UIButton buttonWithFrame:frame titleFont:font titleColor:color title:nil backgroundColor:backColor];
}

+ (UIButton *)buttonWithFrame:(CGRect)frame titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title backgroundColor:(UIColor *)backColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitleFont:font titleColor:color title:title backgroundColor:backColor];
    return button;
}



- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color
{
    [self setTitleFont:font titleColor:color title:nil backgroundColor:nil];
}

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title
{
    [self setTitleFont:font titleColor:color title:title backgroundColor:nil];
}

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    [self setTitleFont:font titleColor:color title:nil backgroundColor:backColor];
}

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title backgroundColor:(UIColor *)backColor;
{
    if (font) {
        [self.titleLabel setFont:font];
    }
    
    if (color) {
        [self setTitleColor:color forState:UIControlStateNormal];
    }
    
    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
    }
    
    if (backColor) {
        [self setBackgroundColor:backColor];
    }
}

- (void)setTitleFont:(UIFont *)font titleColor:(UIColor *)color normalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle
{
    [self setTitleFont:font titleColor:color title:normalTitle backgroundColor:nil];
    
    if (selectedTitle) {
        [self setTitle:selectedTitle forState:UIControlStateSelected];
    }
}



- (void)layoutWithStyle:(LYButtonLayoutStyle)style andSpacing:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    switch (style) {
        case LYButtonLayoutStyleImagePositionTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing) / 2, titleSize.width / 2, (titleSize.height + spacing) / 2, -(titleSize.width / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height + spacing) / 2, -(imageSize.width / 2), -(imageSize.height + spacing) / 2, imageSize.width / 2);
        }
            break;
            
        case LYButtonLayoutStyleImagePositionBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake((titleSize.height + spacing) / 2, titleSize.width / 2, -(titleSize.height + spacing) / 2, -(titleSize.width / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + spacing) / 2, -(imageSize.width / 2), (imageSize.height + spacing) / 2, imageSize.width / 2);
        }
            break;
            
        case LYButtonLayoutStyleImagePositionLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -(spacing / 2), 0.0, spacing / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, spacing / 2, 0.0, -(spacing / 2));
        }
            break;
            
        case LYButtonLayoutStyleImagePositionRight: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing / 2, 0.0, -(titleSize.width + spacing / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -(imageSize.width + spacing / 2), 0.0, (imageSize.width + spacing / 2));
        }
            break;
        default:
            break;
    }
}

@end
