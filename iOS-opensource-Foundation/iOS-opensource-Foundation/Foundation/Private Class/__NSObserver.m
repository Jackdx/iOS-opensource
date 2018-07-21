//
//  __NSObserver.m
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/18.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "__NSObserver.h"
#import <objc/objc-sync.h>
#import <pthread.h>

@implementation __NSObserver

+ (id)observerWithCenter:(id)arg1 queue:(id)arg2 name:(id)arg3 object:(id)arg4 block:(id /* block */)arg5
{
    __NSObserver *obser = [__NSObserver new];
    obser->nc = [arg1 retain];
    obser->queue = [arg2 retain];
    obser->name = [arg3 copy];
    obser->object = arg4;
    obser->block = [arg5 copy];
    objc_sync_enter([__NSObserver self]);
    CFMutableSetRef *_magicObses = NULL;
    if (*_magicObses) {
        *_magicObses = CFSetCreateMutable(nil, 0, nil);
    }
    CFSetAddValue(*_magicObses, obser);
    [obser release];
    objc_sync_exit([__NSObserver self]);
    return obser;
}

- (void)_doit:(id)arg1
{
    if (queue) {
        if ([NSOperationQueue currentQueue] != queue) {
            if (pthread_main_np()) {
                if ([NSOperationQueue mainQueue] != queue) {
                    NSBlockOperation *op = [NSBlockOperation new];
                    //            [op addExecutionBlock:__NSConcreteStackBlock]; // 实际上应该调用这个block，但是取不到
                    [op addExecutionBlock:nil];
                    [queue addOperation:op];
                    [op waitUntilFinished];
                    [op release];
                }
                else
                {
                    [self retain];
                    block(arg1);
                    [self release];
                }
            }
            else
            {
                NSBlockOperation *op = [NSBlockOperation new];
                //            [op addExecutionBlock:__NSConcreteStackBlock]; // 实际上应该调用这个block，但是取不到
                [op addExecutionBlock:nil];
                [queue addOperation:op];
                [op waitUntilFinished];
                [op release];
            }
        }
        else
        {
            [self retain];
            block(arg1);
            [self release];
        }
    }
    else
    {
        [self retain];
        block(arg1);
        [self release];
    }
}
+ (BOOL)isAnObserver:(id)arg1
{
    BOOL isAnObserver = NO;
    objc_sync_enter([__NSObserver self]);
    CFMutableSetRef *_magicObses = NULL;
    if (*_magicObses) {
        isAnObserver = CFSetContainsValue(*_magicObses, arg1);
    }
    objc_sync_exit([__NSObserver self]);
    return isAnObserver;
}
+ (void)forgetObserver:(id)arg1
{
    objc_sync_enter([__NSObserver self]);
    CFMutableSetRef *_magicObses = NULL;
    CFSetRemoveValue(*_magicObses, arg1);
    objc_sync_exit([__NSObserver self]);
}
- (void)dealloc
{
    [nc removeObserver:self];
    [nc release];
    [queue release];
    [name release];
    [block release];
    [super dealloc];
}
- (NSString *)name
{
    return name;
}
- (id)object
{
    return object;
}
@end
