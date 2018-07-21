//
//  NSIndexPath.h
//  iOS-opensource
//
//  Created by jackdeng on 2018/7/16.
//  Copyright © 2018年 DX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNSIndexPath : NSObject <NSCopying, NSSecureCoding> {
@private
    NSUInteger *_indexes;
    NSUInteger _length;
    void *_reserved;
}
+ (NSIndexPath *)indexPathWithIndex:(NSUInteger)index;
+ (NSIndexPath *)indexPathWithIndexes:(const NSUInteger [_Nullable])indexes length:(NSUInteger)length;

- (NSIndexPath *)initWithIndexes:(const NSUInteger [_Nullable])indexes length:(NSUInteger)length NS_DESIGNATED_INITIALIZER;

- (NSIndexPath *)initWithIndex:(NSUInteger)index;


- (NSIndexPath *)indexPathByAddingIndex:(NSUInteger)index;
- (NSIndexPath *)indexPathByRemovingLastIndex;

- (NSUInteger)indexAtPosition:(NSUInteger)position;
@property (readonly) NSUInteger length;

/*!
 @abstract Copies the indexes stored in this index path from the positions specified by positionRange into indexes.
 @param indexes Buffer of at least as many NSUIntegers as specified by the length of positionRange. On return, this memory will hold the index path's indexes.
 @param positionRange A range of valid positions within this index path.  If the location plus the length of positionRange is greater than the length of this index path, this method raises an NSRangeException.
 @discussion
 It is the developer’s responsibility to allocate the memory for the C array.
 */
- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0));

// comparison support
- (NSComparisonResult)compare:(NSIndexPath *)otherObject; // sorting an array of indexPaths using this comparison results in an array representing nodes in depth-first traversal order
@end

NS_ASSUME_NONNULL_END

