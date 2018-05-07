//
//  UILabel+Utility.h
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Utility)

+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color;
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text;
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor;
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor;
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment;
+ (UILabel *)labelWithTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment;


+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color;
+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text;
+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor;
+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor;
+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment;
+ (UILabel *)labelWithFrame:(CGRect)frame textFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment;


- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color;
- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text;
- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backColor;
- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor;
- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text alignment:(NSTextAlignment)alignment;
- (void)setTextFont:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text backgroundColor:(UIColor *)backColor alignment:(NSTextAlignment)alignment;

@end
