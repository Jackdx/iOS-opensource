//
//  NSTimer.m
//  iOS-opensource
//
//  Created by DX on 2018/7/19.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "NSTimer.h"
#import "NSCFTimer.h"

@implementation DNSTimer
+ (NSTimer *)allocWithZone:(struct _NSZone *)zone
{
    NSTimer *timer = nil;
    if ([NSTimer self] != self) {
        timer = NSAllocateObject(self, 0, zone);
    }
    else
    {
        timer = [NSCFTimer allocWithZone:zone];
    }
    return timer;
}
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo
{
    NSTimer *timer = [self allocWithZone:nil];
    return [[timer initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0] interval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo] autorelease];
}
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo
{
    NSTimer *timer = [self allocWithZone:0];
    timer = [timer initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0] interval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    CFRunLoopTimerRef cfTimer = (__bridge CFRunLoopTimerRef)(timer);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), cfTimer, kCFRunLoopDefaultMode);
    return timer;
}
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo
{
    [invocation retainArguments];
    NSTimer *timer = [self allocWithZone:0];
    // 根据invocation拿到需要的参数。
    id userInfo = nil;
    [invocation getArgument:&userInfo atIndex:2];
    timer = [timer initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0] interval:0 target:invocation.target selector:invocation.selector userInfo:userInfo repeats:yesOrNo];
    return [timer autorelease];
}
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo
{
    [invocation retainArguments];
    NSTimer *timer = [self allocWithZone:0];
    // 根据invocation拿到需要的参数。
    id userInfo = nil;
    [invocation getArgument:&userInfo atIndex:2];
    timer = [timer initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:0] interval:0 target:invocation.target selector:invocation.selector userInfo:userInfo repeats:yesOrNo];
    CFRunLoopTimerRef cfTimer = (__bridge CFRunLoopTimerRef)(timer);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), cfTimer, kCFRunLoopDefaultMode);
    return timer;
}
+ (NSTimer *)timerWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui
{
    return [[[self allocWithZone:0] initWithFireDate:date interval:ti target:t selector:s userInfo:ui repeats:NO] autorelease];
}
- (NSTimer *)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(id)ui repeats:(BOOL)rep
{
    _NSRequestConcreteObject(self,_cmd);
    return nil;
}
-(void)invalidate
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
}
- (BOOL)isValid
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
    return NO;
}
- (NSTimeInterval)timeInterval
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
    return 0.0;
}
- (NSTimeInterval)tolerance
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
    return 0.0;
}
- (void)setTolerance:(NSTimeInterval)tolerance
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
}
- (void)fire
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
}
- (NSDate *)fireDate
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
    return nil;
}
- (void)setFireDate:(NSDate *)fireDate
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSTimer"));
}
- (id)userInfo
{
    return nil;
}
- (NSString *)copyDebugDescription
{
    return [[self debugDescription] retain];
}
- (long)order
{
    return 0;
}
- (double)interval
{
    return [self timeInterval];
}
- (double)fireTime
{
    return [[self fireDate] timeIntervalSinceReferenceDate];
}
- (void)setFireTime:(NSTimeInterval)time
{
    [self setFireDate:[NSDate dateWithTimeIntervalSinceReferenceDate:time]];
}
- (double)_cffireTime
{
    return [[self fireDate] timeIntervalSinceReferenceDate];
}
@end

