//
//  NSAttributedString+Utility.h
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/3/20.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LYAttributedObject;

@interface NSAttributedString (Utility)

+ (NSAttributedString *)attributedStringWithObjectArray:(NSArray <LYAttributedObject *>*)array;

@end

@interface LYAttributedObject : NSObject

@property (nonatomic, copy) NSString *string;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;

@end
