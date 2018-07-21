//
//  NSCFTimer.m
//  iOS-opensource
//
//  Created by DX on 2018/7/20.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "NSCFTimer.h"

@implementation NSCFTimer
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    static NSCFTimer *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [self allocWithZone:zone];
    });
    return instance;
}
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(id)ui repeats:(BOOL)rep
{
    [t retain]; // 这里就是NSTimer强引用target
    [ui retain];
    CFRunLoopTimerRef cfTimer = CFRunLoopTimerCreate(kCFAllocatorSystemDefault, [date timeIntervalSinceNow], ti, rep, 0, nil, nil);
    return (__bridge NSCFTimer *)(cfTimer);
}
- (BOOL)isEqual:(id)object
{
    if (object) {
        return  CFEqual(self, object);
    }
    else
    {
        return NO;
    }
}
- (NSUInteger)hash
{
    return CFHash(self);
}
- (instancetype)retain
{
    return CFRetain(self);
}
- (oneway void)release
{
    CFRelease(self);
}
- (BOOL)allowsWeakReference
{
    BOOL allow = _CFIsDeallocating(self, _cmd);
    return (allow == NO);
}
- (BOOL)retainWeakReference
{
    BOOL retain = _CFTryRetain(self, _cmd);
    return retain;
}
- (NSUInteger)retainCount
{
    return CFGetRetainCount(self);
}
// 垃圾回收的方法，iOS中不会使用。故实现略
- (void)finalize
{
    [super finalize];
}
+ (BOOL)automaticallyNotifiesObserversForKey:(id)arg1
{
    return NO;
}
- (BOOL)isValid
{
    return CFRunLoopTimerIsValid(self);
}
- (NSTimeInterval)timeInterval
{
    return CFRunLoopTimerGetInterval(self);
}
- (NSTimeInterval)tolerance
{
    return CFRunLoopTimerGetTolerance(self);
}
- (void)setTolerance:(NSTimeInterval)tolerance
{
    CFRunLoopTimerSetTolerance(self, tolerance);
}
- (void)invalidate
{
    CFRunLoopTimerInvalidate(self);
}
- (NSDate *)fireDate
{
    return [NSDate dateWithTimeIntervalSinceReferenceDate:CFRunLoopTimerGetNextFireDate(self)];
}
- (void)setFireDate:(NSDate *)fireDate
{
    
    CFRunLoopTimerSetNextFireDate(self, [fireDate timeIntervalSinceReferenceDate]);
}
- (id)userInfo
{
    id userInfo = nil;
    CFRunLoopTimerGetContext(self, &userInfo);
    return userInfo;
}
- (void)fire
{
    if ([self isValid]) {
        [self retain];
        CFRunLoopTimerGetContext(self, nil);
        __NSFireTimer(self, nil);
        [self release];
    }
}
- (unsigned long)_cfTypeID
{
    return CFRunLoopTimerGetTypeID();
}
- (instancetype)init
{
    return nil;
}
@end

