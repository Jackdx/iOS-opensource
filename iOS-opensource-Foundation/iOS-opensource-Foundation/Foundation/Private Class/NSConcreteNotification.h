//
//  NSConcreteNotification.h
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSConcreteNotification : NSNotification
{
    BOOL dyingObject;
    NSString *name;
    id object;
    NSDictionary *userInfo;
}

+ (instancetype)newTempNotificationWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;

- (void)dealloc;
- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
- (NSString *)name;
- (id)object;
- (void)recycle;
- (NSDictionary *)userInfo;

@end

