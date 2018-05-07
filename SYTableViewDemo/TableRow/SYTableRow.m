//
//  SYTableRow.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableRow.h"
#import "SYTableViewCell.h"

@implementation SYTableRow

- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name
{
    return [self initWithRowContent:content rowName:name rowTag:0 heihgtDelegate:nil];
}

- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name rowTag:(NSInteger)tag
{
    return [self initWithRowContent:content rowName:name rowTag:tag heihgtDelegate:nil];
}

- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name rowTag:(NSInteger)tag heihgtDelegate:(__weak id <SYTableRowHeihgtDelegate>)delegate
{
    if (self = [super init]) {
        _content = content;
        _rowName = name;
        _rowTag = tag;
        _rowHeihgt = 0.0f;
        _autoAdjustCellHeight = NO;
        
        if (delegate && [delegate conformsToProtocol:@protocol(SYTableRowHeihgtDelegate)]) {
            _delegate = delegate;
        } else if ([self conformsToProtocol:@protocol(SYTableRowHeihgtDelegate)]) {
            _delegate = (id <SYTableRowHeihgtDelegate>)self;
        }
    }
    return self;
}

@end
