//
//  UIColor+Utility.h
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utility)

+ (UIColor *)randomColor;
+ (UIColor *)colorWithHex:(uint)hex;
+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
