//
//  NSNotification.m
//  iOS-opensource
//
//  Created by dengxiang on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "NSNotification.h"
#import "NSConcreteNotification.h"
#import <objc/message.h>
#import <pthread.h>
#import "__NSObserver.h"
#import "NSConcreteNotification.h"

// 这个函数存在于苹果的公共框架中，负责所有抽象类的创建。(这里为了不报错，只是写了方法的空实现。)
int _NSRequestConcreteObject(void *arg0, void *arg1)
{
    return 0;
}
// 这个函数存在于苹果的公共框架中，负责所有抽象类的空实现。(这里为了不报错，只是写了方法的空实现。)
// 抽象类的属性一般都会被子类方法覆盖的。。所以这个函数只是报一些抽象类不能创建对象的异常。
int NSRequestConcreteImplementation(void *arg0, void *arg1, Class arg3)
{
    return 0;
}

@implementation DNSNotification
// class_createInstance([self class], 0);
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if ([NSNotification self] == self) {
        self = [NSConcreteNotification self];
    }
    return NSAllocateObject(self, 0, zone);
}
- (NSNotificationName)name
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSNotification"));
    return nil;
}
- (id)object
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSNotification"));
    return nil;
}
- (NSDictionary *)userInfo
{
    NSRequestConcreteImplementation(self,_cmd,NSClassFromString(@"NSNotification"));
    return nil;
}

- (NSString *)description
{
    id object = self.object;
    NSDictionary *userInfo = self.userInfo;
    NSMutableString *des = [[[NSMutableString alloc] initWithCapacity:256] autorelease];
    NSString *name = self.name;
    Class className = object_getClass(self);
    NSString *contentStr = nil;
    if (object && userInfo) {
        contentStr = [NSString stringWithFormat:@"%@ %p {name = %@}",className,self,name];
    }
    else
    {
        if (object) {
            if (userInfo) {
                contentStr = [NSString stringWithFormat:@"%@ %p {name = %@; object = %@; userInfo = %@}",className,self,name,object,userInfo];
            }
            else
            {
                contentStr = [NSString stringWithFormat:@"%@ %p {name = %@; object = %@}",className,self,name,object];
            }
        }
        else
        {
            contentStr = [NSString stringWithFormat:@"%@ %p {name = %@; userInfo = %@}",className,self,name,userInfo];
        }
    }
    [des appendFormat:@"%@", contentStr];
    return des;
}
- (NSUInteger)hash
{
    return self.name.hash;
}
- (BOOL)isEqual:(id)other
{
    BOOL isEqual = YES;
    if (self != other) {
        if (other) {
            if ([other isKindOfClass:[NSNotification self]]) {
                NSNotification *newOther = (NSNotification *)other;
                if (([newOther.name isEqual:self.name]) && (newOther.object == self.object)) {
                    isEqual = [newOther.userInfo isEqualToDictionary:self.userInfo];
                }
                else
                {
                    isEqual = NO;
                }
            }
            else
            {
                isEqual = NO;
            }
        }
        else
        {
            isEqual = NO;
        }
    }
    return isEqual;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [self retain];
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    BOOL allowsKeyedCoding = aCoder.allowsKeyedCoding;
    if (allowsKeyedCoding) {
        [aCoder encodeObject:self.name forKey:@"NS.name"];
        [aCoder encodeObject:self.object forKey:@"NS.object"];
        [aCoder encodeObject:self.userInfo forKey:@"NS.userInfo"];
    }
    else
    {
        [aCoder encodeObject:self.name];
        [aCoder encodeObject:self.object];
        [aCoder encodeObject:self.userInfo];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    BOOL allowsKeyedCoding = aDecoder.allowsKeyedCoding;
    NSString *name = nil;
    id object = nil;
    NSDictionary *userInfo = nil;
    if (allowsKeyedCoding) {
        name = [aDecoder decodeObjectForKey:@"NS.name"];
        object = [aDecoder decodeObjectForKey:@"NS.object"];
        userInfo = [aDecoder decodeObjectForKey:@"NS.userInfo"];
    }
    else
    {
        name = [aDecoder decodeObject];
        object = [aDecoder decodeObject];
        userInfo = [aDecoder decodeObject];
    }
    return [self initWithName:name object:object userInfo:userInfo];
}

- (Class)classForCoder
{
    return [NSNotification self];
}
- (instancetype)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    _NSRequestConcreteObject(self,_cmd);
    return nil;
}
- (nullable id)replacementObjectForCoder:(NSCoder *)aCoder
{
    return self;
}

@end
@implementation DNSNotification (NSNotificationCreation)

+ (instancetype)notificationWithName:(NSNotificationName)aName object:(nullable id)anObject
{
    return [[[self alloc] initWithName:aName object:anObject userInfo:nil] autorelease];
}
+ (instancetype)notificationWithName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo
{
    return [[[self alloc] initWithName:aName object:anObject userInfo:aUserInfo] autorelease];
}

- (id)init
{
    [NSException raise:NSGenericException format:@"%s: should never be used",__func__];
    return nil;
}

@end

@implementation DNSNotificationCenter

id CFXNotificationCenterCopyDebugInfo(void *arg1)
{
    return nil;
}
bool CFXNotificationCenterIsEmpty(void *arg1,void *arg2)
{
    return false;
}
void CFXNotificationPost(void *arg1,void *arg2, void *arg3)
{
    
}
void * CFXNotificationCenterCreate(void *arg1,void *arg2)
{
    return nil;
}
static pthread_mutex_t __nlock;
static NSNotificationCenter *_standardDefaultCenter;

+ (NSNotificationCenter *)defaultCenter
{
    if ([NSNotificationCenter self] != self) {
        pthread_mutex_lock(&__nlock);
        CFMutableDictionaryRef *__NSDefaultNotificationCenters = nil;
        if (__NSDefaultNotificationCenters) {
            *__NSDefaultNotificationCenters =  CFDictionaryCreateMutable(kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        
        _standardDefaultCenter = CFDictionaryGetValue(*__NSDefaultNotificationCenters, self);
        if (_standardDefaultCenter == nil) {
            _standardDefaultCenter = [[NSNotificationCenter alloc] init];
            if (_standardDefaultCenter) {
                CFDictionarySetValue(*__NSDefaultNotificationCenters, self, _standardDefaultCenter);
                [_standardDefaultCenter release];
            }
        }
        
        pthread_mutex_unlock(&__nlock);
    }
    else
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        NSFileManager *fieM = [NSFileManager defaultManager];
        [fieM _registerForUbiquityAccountChangeNotifications];
        NSProcessInfo *info = [NSProcessInfo processInfo];
        [info _registerForHardwareStateNotifications];
    }
    return _standardDefaultCenter;
}
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    if (aName) {
        NSConcreteNotification *noti = [NSConcreteNotification newTempNotificationWithName:aName object:anObject userInfo:aUserInfo];
        CFXNotificationPost(_impl, noti, nil);
        [noti recycle];
    }
}
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
    if (observer && aSelector) {
        if (aName) {
            aName = @"kCFNotificationAnyName"; // 这是系统底层的一个字符串，我取不到，就自己写死了
        }
        if (anObject) {
            anObject = @"kCFNotificationAnyObject"; // 同上
        }
        
        // CFXNotificationRegisterObserver(); // 调用系统的注册函数
        _Block_object_dispose(nil, 0x8);
        
    }
}
- (id<NSObject>)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification * _Nonnull))block
{
    if (block == nil) {
        [NSException raise:NSInvalidArgumentException format:@"%s: Block cannot be nil",__func__];
    }
    __NSObserver *obser = [__NSObserver observerWithCenter:self queue:queue name:name object:obj block:block];
    if (obser) {
        ((class_isMetaClass([obj class])?YES:NO) & 0xff) << 0xa;
        if (name) {
            name = @"kCFNotificationAnyName"; // 这是系统底层的一个字符串，我取不到，就自己写死了
        }
        if (obj) {
            obj = @"kCFNotificationAnyObject"; // 同上
        }
    }
    // CFXNotificationRegisterObserver(); // 调用系统的注册函数
    _Block_object_dispose(0x1, 0x8);
    return obser;
}
- (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject
{
    [self postNotificationName:aName object:anObject userInfo:nil];
}
- (void)removeObserver:(id)observer
{
    [self removeObserver:observer name:nil object:nil];
}
- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject
{
    
    if (observer) {
        goto part7;
    }
    part1 :
    {
        BOOL isAnobser = [__NSObserver isAnObserver:observer];
        if (isAnobser)
        {
            goto part9;
        }
    }
    part2 :
    {
        if (aName) {
            goto part11;
        }
    }
    part3 :
    {
        if (self) {
            goto part10;
        }
    }
    part4 :
    {
        goto part7;
    }
    part5 :
    {
        if (anObject) {
            goto part8;
        }
    }
    part6 :
    {
        if (aName == nil) {
            aName = @"kCFNotificationAnyName";
        }
        if (anObject) {
            anObject = nil;// kCFNotificationAnyObject
            //            CFXNotificationRemoveObservers();
        }
        if (observer) {
            [__NSObserver forgetObserver:observer];
        }
        return;
    }
    part7 :
    {
        return;
    }
    part8 :
    {
        goto part9;
    }
    part9 :
    {
        if (aName == nil) {
            aName = @"kCFNotificationAnyName";
        }
        if (anObject) {
            anObject = nil;// kCFNotificationAnyObject
            //            CFXNotificationRemoveObservers();
        }
        if (observer) {
            [__NSObserver forgetObserver:observer];
        }
        return;
    }
    part10 :
    {
        goto part5;
    }
    part11 :
    {
        goto part10;
    }
}
- (instancetype)init
{
    _impl = CFXNotificationCenterCreate(kCFAllocatorDefault, nil);
    return self;
}
- (void)postNotification:(NSNotification *)notification
{
    if (notification == nil) {
        [NSException raise:NSInvalidArgumentException format:@"%s: notification is nil",__func__];
    }
    CFXNotificationPost(_impl, notification, nil);
}
- (void)finalize
{
    if (_impl) {
        CFRelease(_impl);
    }
    [super finalize];
}
- (void)dealloc
{
    if (_impl) {
        CFRelease(_impl);
    }
    [super dealloc];
}
- (NSString *)description
{
    CFTypeRef cf = CFCopyDescription(_impl);
    NSString *description = nil;
    if (cf) {
        description = CFMakeCollectable(cf);
    }
    return [description autorelease];
}
- (BOOL)isEmpty
{
    BOOL isEmpty = CFXNotificationCenterIsEmpty(_impl,_cmd);
    return isEmpty;
}
- (NSString *)debugDescription
{
    NSMutableString *debugStr = [NSMutableString stringWithFormat:@"<%@:%p>\n",[self class],self];
    NSString *copyDe =  CFXNotificationCenterCopyDebugInfo(_impl);
    [debugStr appendString:copyDe];
    CFRelease(copyDe);
    return debugStr;
}
@end

