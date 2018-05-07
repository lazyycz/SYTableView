//
//  NSAttributedString+Utility.m
//  CommonlyUtilityDemo
//
//  Created by Stone.Yu on 2018/3/20.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "NSAttributedString+Utility.h"

@implementation NSAttributedString (Utility)

+ (NSAttributedString *)attributedStringWithObjectArray:(NSArray <LYAttributedObject *>*)array
{
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    for (LYAttributedObject *object in array) {
        if (!object.string || !object.font || !object.color) continue;
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:object.string attributes:@{ NSFontAttributeName : object.font, NSForegroundColorAttributeName: object.color }];
        [attributedString appendAttributedString:string];
    }
    return attributedString.copy;
}

@end

@implementation LYAttributedObject : NSObject

- (instancetype)initWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
    if (self = [super init]) {
        _string = string;
        _font = font;
        _color = color;
    }
    return self;
}

@end
