//
//  UICollectionViewData.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/10.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UICollectionViewData : NSObject
{
    NSMutableArray *_clonedCellAttributes;
    NSMutableArray *_clonedDecorationAttributes;
    NSMutableArray *_clonedSupplementaryAttributes;
    UICollectionView *_collectionView;
    struct {
        unsigned int contentSizeIsValid : 1;
        unsigned int itemCountsAreValid : 1;
        unsigned int layoutIsPrepared : 1;
        unsigned int layoutLocked : 1;
    } _collectionViewDataFlags;
    CGSize _contentSize;
    NSMutableDictionary *_decorationLayoutAttributes;
    NSMutableIndexSet *_globalIndexesOfItemsAwaitingValidation;
    id _globalItems;
    NSMutableDictionary *_invalidatedDecorationIndexPaths;
    NSMutableDictionary *_invalidatedSupplementaryIndexPaths;
    int _lastResultForNumberOfItemsBeforeSection;
    int _lastSectionTestedForNumberOfItemsBeforeSection;
    UICollectionViewLayout *_layout;
    int _numItems;
    int _numSections;
    NSMapTable *_screenPageMap;
    int *_sectionItemCounts;
    NSMutableDictionary *_supplementaryLayoutAttributes;
    CGRect _validLayoutRect;
}

@property (nonatomic, readonly) NSArray *clonedCellAttributes;
@property (nonatomic, readonly) NSArray *clonedDecorationAttributes;
@property (nonatomic, readonly) NSArray *clonedSupplementaryAttributes;
@property (nonatomic) CGSize contentSize;
@property (nonatomic, readonly) BOOL layoutIsPrepared;
@property (getter=isLayoutLocked, nonatomic) BOOL layoutLocked;

+ (void)initialize;

- (void)_loadEverything;
- (void)_prepareToLoadData;
- (id)_screenPageForPoint:(CGPoint)arg1;
- (void)_setLayoutAttributes:(id)arg1 atGlobalItemIndex:(int)arg2;
- (void)_updateItemCounts;
- (void)_validateContentSize;
- (void)_validateItemCounts;
- (id)clonedCellAttributes;
- (id)clonedDecorationAttributes;
- (id)clonedSupplementaryAttributes;
- (CGRect)collectionViewContentRect;
- (CGSize)contentSize;
- (void)dealloc;
- (id)existingSupplementaryLayoutAttributes;
- (id)existingSupplementaryLayoutAttributesInSection:(int)arg1;
- (int)globalIndexForItemAtIndexPath:(id)arg1;
- (id)indexPathForItemAtGlobalIndex:(int)arg1;
- (id)initWithCollectionView:(id)arg1 layout:(id)arg2;
- (void)invalidate:(BOOL)arg1;
- (void)invalidateDecorationIndexPaths:(id)arg1;
- (void)invalidateItemsAtIndexPaths:(id)arg1;
- (void)invalidateSupplementaryIndexPaths:(id)arg1;
- (BOOL)isLayoutLocked;
- (id)knownDecorationElementKinds;
- (id)knownSupplementaryElementKinds;
- (id)layoutAttributesForCellsInRect:(CGRect)arg1 validateLayout:(BOOL)arg2;
- (id)layoutAttributesForDecorationViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (id)layoutAttributesForElementsInRect:(CGRect)arg1;
- (id)layoutAttributesForElementsInSection:(int)arg1;
- (id)layoutAttributesForGlobalItemIndex:(int)arg1;
- (id)layoutAttributesForItemAtIndexPath:(id)arg1;
- (id)layoutAttributesForSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (BOOL)layoutIsPrepared;
- (int)numberOfItems;
- (int)numberOfItemsBeforeSection:(int)arg1;
- (int)numberOfItemsInSection:(int)arg1;
- (int)numberOfSections;
- (CGRect)rectForDecorationElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (CGRect)rectForGlobalItemIndex:(int)arg1;
- (CGRect)rectForItemAtIndexPath:(id)arg1;
- (CGRect)rectForSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)setContentSize:(CGSize)arg1;
- (void)setLayoutLocked:(BOOL)arg1;
- (void)validateDecorationViews;
- (void)validateLayoutInRect:(CGRect)arg1;
- (void)validateSupplementaryViews;
@end
