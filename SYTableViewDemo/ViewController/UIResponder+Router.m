//
//  UIResponder+Router.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/7/24.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "UIResponder+Router.h"
#import <objc/runtime.h>

static char *kEventStrategy = "EventStrategy";

@implementation UIResponder (Router)

#pragma mark - public

- (void)addEventWithIdentifier:(NSUInteger)identifier selector:(SEL)aSelector
{
    if (!aSelector) return;
    
    NSMutableDictionary *strategy = [self eventStrategy];
    strategy[@(identifier)] = [self creatInvocationWithSelector:aSelector];
}

- (void)addEventWithName:(NSString *)name selector:(SEL)aSelector
{
    if (!name || !aSelector) return;
    
    NSMutableDictionary *strategy = [self eventStrategy];
    strategy[name] = [self creatInvocationWithSelector:aSelector];
}

- (void)routerEventWithIdentifier:(NSInteger)identifier object:(nullable id)anObject
{
    [[self nextResponder] routerEventWithIdentifier:identifier object:anObject];
}

- (void)routerEventWithName:(NSString *)eventName object:(nullable id)anObject
{
    [[self nextResponder] routerEventWithName:eventName object:anObject];
}

#pragma mark - private

- (NSInvocation *)creatInvocationWithSelector:(SEL)selector
{
    if (!selector) return nil;
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    invocation.selector = selector;
    invocation.target = self;
    return invocation;
}

- (void)invokeInvocationWithKey:(id)key object:(nullable id)anObject
{
    if (!key) return;
    
    NSMutableDictionary *enventStrategy = [self eventStrategy];
    if (!enventStrategy.count) return;
    
    NSInvocation *invocation = enventStrategy[key];
    if (!invocation) return;
    
    [invocation setArgument:&anObject atIndex:2];
    [invocation invoke];
}

#pragma mark - getter

- (NSMutableDictionary *)eventStrategy
{
    NSMutableDictionary *strategy = objc_getAssociatedObject(self, kEventStrategy);
    if (!strategy)
    {
        strategy = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, kEventStrategy, strategy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return strategy;
}

@end

/* ------------------------ 华丽的分割线 ------------------------ */

@interface UIViewController (Router)

@end

@implementation UIViewController (Router)

- (void)routerEventWithIdentifier:(NSInteger)identifier object:(nullable id)anObject
{
    [self invokeInvocationWithKey:@(identifier) object:anObject];
    
    // 如果需要让事件继续往上传递，则调用下面的语句
    // [super routerEventWithIdentifier:identifier object:anObject];
}

- (void)routerEventWithName:(NSString *)eventName object:(nullable id)anObject
{
    [self invokeInvocationWithKey:eventName object:anObject];

    // 如果需要让事件继续往上传递，则调用下面的语句
    // [super routerEventWithName:eventName object:anObject];
}

@end
