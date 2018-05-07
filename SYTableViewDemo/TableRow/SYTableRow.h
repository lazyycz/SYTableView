//
//  SYTableRow.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol SYTableRowHeihgtDelegate;

@interface SYTableRow : NSObject

@property (nonatomic, strong) id content;
@property (nonatomic, copy) NSString *rowName;
@property (nonatomic, assign) NSInteger rowTag;
@property (nonatomic, weak) id <SYTableRowHeihgtDelegate> delegate;

@property (nonatomic, assign) BOOL autoAdjustRowHeight;
@property (nonatomic, assign) CGFloat rowHeihgt;

- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name;
- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name rowTag:(NSInteger)tag;
- (instancetype)initWithRowContent:(id)content rowName:(NSString *)name rowTag:(NSInteger)tag heihgtDelegate:(__weak id <SYTableRowHeihgtDelegate>)delegate;

@end

@protocol SYTableRowHeihgtDelegate <NSObject>

- (CGFloat)tableRowCellHeightWithContent:(id)content;
- (CGFloat)tableRowHeaderHeightWithContent:(id)content;
- (CGFloat)tableRowFooterHeightWithContent:(id)content;

@end
