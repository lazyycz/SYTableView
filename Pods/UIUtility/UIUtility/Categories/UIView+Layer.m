//
//  UIView+Layer.m
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/1/10.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

- (void)setLayerCordius:(CGFloat)cor
{
    [self setLayerCordius:cor borderWidth:CGFLOAT_MIN borderColor:nil layerBackColor:nil];
}

- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width
{
    [self setLayerCordius:cor borderWidth:width borderColor:nil layerBackColor:nil];
}

- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width borderColor:(UIColor *)color
{
    [self setLayerCordius:cor borderWidth:width borderColor:color layerBackColor:nil];
}

- (void)setLayerCordius:(CGFloat)cor borderWidth:(CGFloat)width borderColor:(UIColor *)color layerBackColor:(UIColor *)backColor
{
    [self.layer setCornerRadius:cor];
    [self.layer setBorderWidth:width];
    [self.layer setMasksToBounds:YES];
    
    if (color) {
        [self.layer setBorderColor:[color CGColor]];
    }
    
    if (backColor) {
        [self.layer setBackgroundColor:[backColor CGColor]];
    }
}

@end
