//
//  UIImage+Utility.h
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color imageSize:(CGSize)size;

/// 切图片圆角
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;

@end
