//
//  UIView+Layer.h
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

- (void)setLayerCordius:(CGFloat)cor;
- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width;
- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width borderColor:(UIColor *)color;
- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width borderColor:(UIColor *)color layerBackColor:(UIColor *)backColor;

@end
