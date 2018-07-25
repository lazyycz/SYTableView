//
//  UIResponder+Router.h
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/7/24.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)addEventWithIdentifier:(NSUInteger)identifier selector:(SEL)aSelector;
- (void)addEventWithName:(NSString *)name selector:(SEL)aSelector;

- (void)routerEventWithIdentifier:(NSInteger)identifier object:(nullable id)anObject;
- (void)routerEventWithName:(NSString *)eventName object:(nullable id)anObject;

@end

@interface UIViewController (Router)

@end
