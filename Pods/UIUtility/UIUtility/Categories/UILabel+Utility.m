//
//  UILabel+Utility.m
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "UILabel+Utility.h"

@implementation UILabel (Utility)

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color
{
    return [UILabel labelWithTextFont:font textColor:color text:nil backgroundColor:nil alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text
{
    return [UILabel labelWithTextFont:font textColor:color text:text backgroundColor:nil alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [UILabel labelWithTextFont:font textColor:color text:nil backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor
{
    return [UILabel labelWithTextFont:font textColor:color text:text backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment
{
    return [UILabel labelWithTextFont:font textColor:color text:text backgroundColor:nil alignment:alignment];
}

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTextFont:font textColor:color text:text backgroundColor:backColor alignment:alignment];
    return label;
}



+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color
{
    return [UILabel labelWithFrame:frame textFont:font textColor:color text:nil backgroundColor:nil alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text
{
    return [UILabel labelWithFrame:frame textFont:font textColor:color text:text backgroundColor:nil alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    return [UILabel labelWithFrame:frame textFont:font textColor:color text:nil backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor
{
    return [UILabel labelWithFrame:frame textFont:font textColor:color text:text backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment
{
    return [UILabel labelWithFrame:frame textFont:font textColor:color text:text backgroundColor:nil alignment:alignment];
}

+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setTextFont:font textColor:color text:text backgroundColor:backColor alignment:alignment];
    return label;
}



- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color
{
    [self setTextFont:font textColor:color text:nil backgroundColor:nil alignment:NSTextAlignmentLeft];
}

- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text
{
    [self setTextFont:font textColor:color text:text backgroundColor:nil alignment:NSTextAlignmentLeft];
}

- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor
{
    [self setTextFont:font textColor:color text:nil backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor
{
    [self setTextFont:font textColor:color text:text backgroundColor:backColor alignment:NSTextAlignmentLeft];
}

- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment
{
    [self setTextFont:font textColor:color text:text backgroundColor:nil alignment:alignment];
}

- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment
{
    if (font) {
        [self setFont:font];
    }
    
    if (color) {
        [self setTextColor:color];
    }
    
    if (text) {
        [self setText:text];
    }
    
    if (backColor) {
        [self setBackgroundColor:backColor];
    }
    
    [self setTextAlignment:alignment];
}

@end
