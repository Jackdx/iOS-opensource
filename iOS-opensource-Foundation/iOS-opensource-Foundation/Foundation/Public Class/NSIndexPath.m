//
//  NSIndexPath.m
//  iOS-opensource
//
//  Created by jackdeng on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import "NSIndexPath.h"

static NSIndexPath *NSIndexPathTaggedClass = nil;
int _makeInlinePayload(void *arg0, void * arg1)
{
    return 0;
}
@implementation DNSIndexPath
+ (void)initialize
{
    if ([NSIndexPath self] == self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        NSIndexPathTaggedClass = (NSIndexPath *)self;
    }
}
+ (NSIndexPath *)indexPathWithIndex:(NSUInteger)index
{
    NSIndexPath *indexPath = nil;
    if ((index <= 0x1fff) && (NSIndexPathTaggedClass == self)) {
        //        indexPath = 0xc00000000000000e | 0xfffffffffffff00 & index << 0x8;
    }
    else
    {
        indexPath = [[[NSIndexPath alloc] initWithIndexes:&index length:1] autorelease];
    }
    return indexPath;
}
- (NSUInteger)length
{
    return _length;
}
- (NSUInteger)indexAtPosition:(NSUInteger)position
{
    NSUInteger maxNum = 0x7fffffffffffffff;
    if (position != maxNum) {
        maxNum = _indexes[position];
    }
    return maxNum;
}
- (NSIndexPath *)initWithIndexes:(const NSUInteger [])indexes length:(NSUInteger)length
{
    self = [super init];
    if ((length <= 0x3fffffff) && self) {
        int makeInline = _makeInlinePayload(&indexes, &length);
        if (makeInline) {
            if (self != NSIndexPathTaggedClass) {
                if ([self isMemberOfClass:[NSIndexPath class]]) {
                    _reserved = &makeInline;
                }
                else
                {
                    _indexes = NSZoneMalloc(0, length * 8);
                    _length = length;
                }
            }
            else
            {
                [self release];
                self = nil;
            }
        }
        else
        {
            _indexes = NSZoneMalloc(0, length * 8);
            _length = length;
        }
    }
    else
    {
        [self release];
        self = nil;
    }
    return self;
}
- (BOOL)isEqual:(id)object
{
    if (self == object) { //判断是否同一地址，如果是就返回yes
        return YES;
    }
    if (object == nil) { //判断obj是否为空，如果是空就返回no
        return NO;
    }
    if ([object isKindOfClass:[NSIndexPath self]] == NO) { // 判断obj是不是NSIndexPath或它的子类，如果不是，就返回no
        return NO;
    }
    NSIndexPath *objIndexPath = (NSIndexPath *)object;
    NSUInteger selfLen = [self length];
    NSUInteger objLen = [objIndexPath length];
    if (selfLen != objLen) { // 判断长度是否相同，如果不等，返回no
        return NO;
    }
    if (selfLen == 0) { // 这里判断长度都是0，也就是都是空(<NSIndexPath: 0x1c40330c0> {length = 0, path = })，地址不同，但是也认为相等
        return YES;
    }
    for (NSUInteger i = 0; i < selfLen; i++) { //在长度相同的情况下，依次比较元素。
        if ([self indexAtPosition:i] != [objIndexPath indexAtPosition:i]) {
            return NO;
        }
    }
    return YES;
}
//typedef NS_ENUM(NSInteger, NSComparisonResult) {NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};
- (NSComparisonResult)compare:(NSIndexPath *)otherObject
{
    NSComparisonResult result = NSOrderedDescending; // 递减
    if (otherObject == nil) {
        return result;
    }
    if (otherObject == self) {
        return NSOrderedSame;
    }
    if ([otherObject isKindOfClass:[NSIndexPath self]] == NO) {
        NSString *reason = [NSString stringWithFormat:@"Unable to compare %@ with object of different class: %@", self, otherObject];
        [NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil];
    }
    NSIndexPath *objIndexPath = (NSIndexPath *)otherObject;
    NSUInteger selfLen = [self length];
    NSUInteger objLen = [objIndexPath length];
    NSUInteger minLen = MIN(selfLen, objLen);
    NSInteger minus = selfLen - objLen;
    for (NSUInteger i = 0; i < minLen; i++) {
        NSInteger selfIndexNum = [self indexAtPosition:i];
        NSUInteger objIndexNum = [objIndexPath indexAtPosition:i];
        if (selfIndexNum < objIndexNum) {
            return NSOrderedAscending; // 前者比后者小
        }
        else if (selfIndexNum > objIndexNum)
        {
            return NSOrderedDescending;
        }
    }
    if (minus == 0) {
        return NSOrderedSame;
    }
    else
    {
        return minus > 0 ? NSOrderedDescending: NSOrderedAscending;
    }
    return result;
}
- (void)dealloc
{
    if (_indexes) {
        free(_indexes);
    }
    [super dealloc];
}
+ (NSIndexPath *)indexPath
{
    NSIndexPath *indexPath = nil;
    if (NSIndexPathTaggedClass != self) {
        indexPath = [[[self alloc] initWithIndexes:nil length:0] autorelease];
    }
    else
    {
        indexPath = NSIndexPathTaggedClass;
    }
    return indexPath;
}
+ (NSIndexPath *)indexPathWithIndexes:(const NSUInteger [])indexes length:(NSUInteger)length
{
    return [[[self alloc] initWithIndexes:indexes length:length] autorelease];
}
- (id)init
{
    return [self initWithIndexes:nil length:0];
}
- (NSIndexPath *)initWithIndex:(NSUInteger)index
{
    return [self initWithIndexes:&index length:1];
}
- (id)copyWithZone:(nullable NSZone *)zone
{
    return [self retain];
}
- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange
{
    NSInteger length = [self length]; // 传负数为溢出为负数
    if ((length < 0) || [self length] < positionRange.length) {
        [NSException raise:NSRangeException format:@"%s: range %@ beyond bounds (%lu)",__func__,NSStringFromRange(positionRange),length];
    }
    
    NSUInteger location = positionRange.location;
    NSUInteger ranLen = positionRange.length;
    for (NSUInteger i = 0; i < ranLen; i++) {
        *(indexes+i) = _indexes[location+i];
    }
}
- (void)getIndexes:(NSUInteger *)indexes
{
    [self length];
    [self getIndexes:indexes range:NSMakeRange(0, 0)];
}

- (NSIndexPath *)indexPathByRemovingLastIndex
{
    NSUInteger length = [self length];
    NSUInteger *index = nil;
    [self getIndexes:index range:NSMakeRange(0, length-1)];
    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:index length:length-1];
    return indexPath;
}

- (NSIndexPath *)indexPathByAddingIndex:(NSUInteger)index
{
    NSUInteger originLen = [self length];
    NSUInteger newLen = originLen + 1;
    NSUInteger changeLen = newLen >> 0x3d;
    void *err = nil;
    if (changeLen) {
        [NSException raise:NSGenericException format:@"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",newLen];
        if (NSAllocateCollectable(newLen * 8, 0) == 0) {
            [NSException raise:NSMallocException format:@"*** attempt to create an NSUInteger buffer of length (%lu) failed",newLen];
        }
    }
    else
    {
        void *err = NSAllocateCollectable(newLen * 8, 0);
        if (err) {
            [NSException raise:NSMallocException format:@"*** attempt to create an NSUInteger buffer of length (%lu) failed",newLen];
        }
    }
    [self getIndexes:err range:NSMakeRange(0, 0)];
    NSIndexPath *reIndexPath = [NSIndexPath indexPathWithIndexes:err length:newLen];
    //    *(&err + 1) = index;
    return reIndexPath;
}

- (NSUInteger)hash
{
    NSUInteger length = [self length];
    NSUInteger hash = 0;
    if (length) {
        hash = ([self indexAtPosition:0] + length) + ([self indexAtPosition:(length - 1)]);
    }
    else
    {
        hash = 6;
    }
    return hash;
}
- (NSString *)description
{
    NSUInteger length = [self length];
    NSMutableString *desStr = [NSMutableString stringWithFormat: @"%@ {length = %lu, path = ",[super description],length];
    if (length) {
        int i = 0;
        do {
            NSUInteger indexNum = [self indexAtPosition:i];
            i++;
            NSString *blankStr = @"";
            NSString *horizontalStr = @" - ";
            if (i < length) {
                blankStr = horizontalStr;
            }
            [desStr appendFormat:@"%lu%@",indexNum,blankStr];
        } while (length != i);
    }
    [desStr appendString:@"}"];
    return desStr;
}
+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (NSIndexPath *)initWithCoder:(NSCoder *)aDecoder
{
    if ([aDecoder allowsKeyedCoding] == NO) {
        [super description];
        [NSException raise:NSInvalidArgumentException format:@"%@ cannot be serialized with a coder that does not support keyed archiving",self];
    }
    if ([aDecoder containsValueForKey:@"NSIndexPathLength"] == NO) {
        [self release];
        [NSException raise:NSInternalInconsistencyException format:@"-[NSIndexPath initWithCoder:] decoder did not provide a length value for the indexPath."];
    }
    NSUInteger length = [aDecoder decodeIntegerForKey:@"NSIndexPathLength"];
    NSData *data = [aDecoder decodeObjectOfClasses:[NSData class] forKey:@"NSIndexPathData"];
    const void *dataBytes = [data bytes];
    if (((length >= 2) && dataBytes) && ([aDecoder requiresSecureCoding])) {
        NSUInteger dataLen = [data length];
        //        NSUInteger tempNum = 0;
        if (dataLen) {
            do {
                //                tempNum = tempNum + (*(int8_t *))dataBytes;
                dataBytes = dataBytes + 1;
                dataLen = dataLen - 1;
            } while (dataLen);
        }
        
    }
    NSUInteger reduceLen = length >> 0x3d;
    if (reduceLen) {
        [NSException raise:NSGenericException format:@"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",length];
    }
    
    if (length) {
        if (length == 1) {
            if ([aDecoder respondsToSelector:@selector(containsValueForKey:)]) {
                [aDecoder decodeIntegerForKey:@"NSIndexPathValue"];
            }
            else
            {
                [self release];
                [NSException raise:NSInternalInconsistencyException format:@"-[NSIndexPath initWithCoder:] decoder did not provide indexPath data."];
            }
        }
    }
    NSIndexPath *indexPath = [self initWithIndexes:nil length:length];
    return indexPath;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if ([aCoder allowsKeyedCoding] == 0) {
        [super description];
        [NSException raise:NSInvalidArgumentException format:@"%@ cannot be serialized with a coder that does not support keyed archiving",self];
    }
    NSUInteger length = [self length];
    [aCoder encodeInteger:length forKey:@"NSIndexPathLength"];
    if (length) {
        if (length == 1) {
            [aCoder encodeInteger:[self indexAtPosition:0] forKey:@"NSIndexPathValue"];
        }
        else
        {
            NSMutableData *data = [[NSMutableData alloc] initWithCapacity:length];
            int8_t *int8_t_p = nil;
            NSUInteger index = 0;
            do {
                NSUInteger indexNum = [self indexAtPosition:index];
                if (indexNum >= 0x80) {
                    // 针对超过128的处理
                    NSUInteger temp = 0;
                    do {
                        *int8_t_p = indexNum | 0x80;
                        int8_t_p = int8_t_p + 1;
                        temp = indexNum > 0x3fff;
                        indexNum = indexNum >> 0x7;
                    } while (temp);
                }
                *int8_t_p = indexNum;
                [data appendBytes:int8_t_p length:(int8_t_p+1)];
                index++;
            } while (index != length);
            [aCoder encodeObject:data forKey:@"NSIndexPathData"];
            [data release];
        }
    }
}
@end

