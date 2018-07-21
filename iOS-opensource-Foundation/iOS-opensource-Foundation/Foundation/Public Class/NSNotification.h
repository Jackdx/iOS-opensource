//
//  NSNotification.h
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <Foundation/Foundation.h>


//因为系统已经存在公开类NSNotification，故不能同名，加一个前缀D
NS_ASSUME_NONNULL_BEGIN

/****************    Notifications    ****************/

@interface DNSNotification : NSObject <NSCopying, NSCoding>

@property (readonly, copy) NSNotificationName name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(NSNotificationName)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0)) NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
@end

@interface DNSNotification (NSNotificationCreation)

+ (instancetype)notificationWithName:(NSNotificationName)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (instancetype)init /*NS_UNAVAILABLE*/;    /* do not invoke; not a valid initializer for this class */

@end

/****************    Notification Center    ****************/

@interface DNSNotificationCenter : NSObject {
    @package
    void *_impl;
    void *_callback;
    void *_pad;
}

@property (class, readonly, strong) NSNotificationCenter *defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;

- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

- (id <NSObject>)addObserverForName:(nullable NSNotificationName)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
// The return value is retained by the system, and should be held onto by the caller in
// order to remove the observer with removeObserver: later, to stop observation.

@end


NS_ASSUME_NONNULL_END

