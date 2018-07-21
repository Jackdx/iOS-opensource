//
//  NSConcreteNotification.m
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "NSConcreteNotification.h"

@implementation NSConcreteNotification
+ (instancetype)newTempNotificationWithName:(NSString *)newName object:(id)newObject userInfo:(NSDictionary *)newUserInfo
{
    NSConcreteNotification *conNoti = NSAllocateObject(self , 0 ,nil);
    NSString *name = [newName copy];
    [conNoti setValue:name forKey:@"name"];
    if (newObject) {
        conNoti->object = [newObject retain];
    }
    if (newUserInfo) {
        conNoti->userInfo = [newUserInfo retain];
    }
    return conNoti;
}
- (NSString *)name
{
    return [[name retain] autorelease];
}
- (id)object
{
    return object;
}
- (void)recycle
{
    if (object && dyingObject) {
        CFRelease(object);
        object = nil;
    }
    [self release];
}
- (void)dealloc
{
    [name release];
    [object release];
    [userInfo release];
    [super dealloc];
}
- (instancetype)initWithName:(NSString *)newName object:(id)newObject userInfo:(NSDictionary *)newUserInfo
{
    if (self) {
        name = [newName copy];
        object = [newObject retain];
        userInfo = [newUserInfo retain];
    }
    else
    {
        [self release];
        self = nil;
    }
    return self;
}

- (NSDictionary *)userInfo
{
    return [[userInfo retain] autorelease];
}
@end

