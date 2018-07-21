//
//  __NSObserver.h
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/18.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSNotificationBlock)(NSNotification *note);
@interface __NSObserver : NSObject
{
    NSNotificationBlock block;
    NSString *name;
    NSNotificationCenter *nc;
    id object;
    NSOperationQueue *queue;
}
+ (void)forgetObserver:(id)arg1;
+ (BOOL)isAnObserver:(id)arg1;
+ (id)observerWithCenter:(id)arg1 queue:(id)arg2 name:(id)arg3 object:(id)arg4 block:(id /* block */)arg5;

- (void)_doit:(id)arg1;
- (void)dealloc;
- (NSString *)name;
- (id)object;

@end
