//
//  UITableViewRowData.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/8.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITableViewRowData : NSObject <NSCopying>
{
    BOOL _estimatesRowHeights;
    NSIndexPath *_gapIndexPath;
    float _heightForTableHeaderViewHiding;
    float _minimumRowHeight;
    int _numSections;
    NSIndexPath *_reorderedIndexPath;
    float _reorderedRowHeight;
    id _sectionRowData;
    int _sectionRowDataCapacity;
    float _tableBottomPadding;
    float _tableFooterHeight;
    BOOL _tableFooterHeightValid;
    float _tableHeaderHeight;
    BOOL _tableHeaderHeightValid;
    float _tableSidePadding;
    BOOL _tableSidePaddingValid;
    float _tableTopPadding;
    UITableView *_tableView;
    float _tableViewWidth;
}
@property (nonatomic) BOOL estimatesRowHeights;
@property (nonatomic, readonly) float heightForAutohidingTableHeaderView;
@property (nonatomic, readonly) float heightForTableHeaderViewHiding;
@property (nonatomic) float minimumRowHeight;
@property (nonatomic, readonly) NSIndexPath *reorderGapIndexPath;
@property (nonatomic, readonly) float reorderedRowHeight;
@property (nonatomic) float tableBottomPadding;
@property (nonatomic) float tableSidePadding;
@property (nonatomic) float tableTopPadding;

- (void)_assertValidIndexPath:(id)arg1 allowEmptySection:(BOOL)arg2;
- (void)_ensureSectionOffsetIsValidForSection:(int)arg1;
- (id)_nextIndexPathOrSectionHeader:(id)arg1;
- (id)_previousIndexPathOrSectionHeader:(id)arg1;
- (int)_sectionForPoint:(CGPoint)arg1 beginningWithSection:(int)arg2 numberOfSections:(int)arg3;
- (int)_sectionRowForGlobalRow:(int)arg1 inSection:(int*)arg2;
- (void)_updateNumSections;
- (void)_updateSectionRowDataArrayForNumSections:(int)arg1;
- (void)_updateTopAndBottomPadding;
- (void)addReorderGapFromIndexPath:(id)arg1;
- (void)adjustSectionOffsetsBeginningAtIndex:(int)arg1 count:(int)arg2 delta:(float)arg3 rowDelta:(int)arg4;
- (id)copyWithZone:(NSZone *)arg1;
- (void)dealloc;
- (void)ensureAllSectionsAreValid;
- (BOOL)ensureHeightsFaultedInForIndexPath:(id)arg1 availHeight:(float)arg2 edgeInset:(UIEdgeInsets)arg3 scrollPosition:(int)arg4;
- (BOOL)estimatesRowHeights;
- (CGRect)floatingRectForFooterInSection:(int)arg1 visibleRect:(CGRect)arg2;
- (CGRect)floatingRectForHeaderInSection:(int)arg1 visibleRect:(CGRect)arg2;
- (int)footerAlignmentForSection:(int)arg1;
- (int)globalRowForRowAtIndexPath:(id)arg1;
- (NSRange)globalRowsInRect:(CGRect)arg1 canGuess:(BOOL)arg2;
- (BOOL)hasFooterForSection:(int)arg1;
- (BOOL)hasHeaderForSection:(int)arg1;
- (int)headerAlignmentForSection:(int)arg1;
- (float)heightForAutohidingTableHeaderView;
- (float)heightForFooterInSection:(int)arg1 canGuess:(BOOL)arg2;
- (float)heightForHeaderInSection:(int)arg1 canGuess:(BOOL)arg2;
- (float)heightForRow:(int)arg1 inSection:(int)arg2 canGuess:(BOOL)arg3;
- (float)heightForRow:(int)arg1 inSection:(int)arg2 canGuess:(BOOL)arg3 adjustForReorderedRow:(BOOL)arg4;
- (float)heightForSection:(int)arg1;
- (float)heightForTable;
- (float)heightForTableFooterView;
- (float)heightForTableHeaderView;
- (float)heightForTableHeaderViewHiding;
- (id)indexPathForRowAtGlobalRow:(int)arg1;
- (id)indexPathsForRowsInRect:(CGRect)arg1;
- (id)indexPathsForRowsInRect:(CGRect)arg1 extraHitSpaceBetweenRows:(float)arg2;
- (id)initWithTableView:(id)arg1;
- (void)invalidateAllSectionOffsetsAndUpdatePadding;
- (void)invalidateAllSections;
- (void)invalidateSection:(int)arg1;
- (float)maxFooterTitleWidthForSection:(int)arg1;
- (float)maxHeaderTitleWidthForSection:(int)arg1;
- (float)minimumRowHeight;
- (void)moveRowAtIndexPathFrom:(id)arg1 toIndexPath:(id)arg2;
- (int)numberOfRows;
- (int)numberOfRowsBeforeSection:(int)arg1;
- (int)numberOfRowsInSection:(int)arg1;
- (int)numberOfSections;
- (float)offsetForSection:(id)arg1;
- (CGRect)rectForFooterInSection:(int)arg1 heightCanBeGuessed:(BOOL)arg2;
- (CGRect)rectForGlobalRow:(int)arg1 heightCanBeGuessed:(BOOL)arg2;
- (CGRect)rectForHeaderInSection:(int)arg1 heightCanBeGuessed:(BOOL)arg2;
- (CGRect)rectForRow:(int)arg1 inSection:(int)arg2 heightCanBeGuessed:(BOOL)arg3;
- (CGRect)rectForSection:(int)arg1;
- (CGRect)rectForTable;
- (CGRect)rectForTableFooterView;
- (CGRect)rectForTableHeaderView;
- (void)removeReorderGapFromIndexPath:(id)arg1;
- (id)reorderGapIndexPath;
- (id)reorderedIndexPath;
- (float)reorderedRowHeight;
- (int)sectionForPoint:(CGPoint)arg1;
- (int)sectionForSectionRowData:(id)arg1;
- (int)sectionLocationForReorderedRow:(int)arg1 inSection:(int)arg2;
- (int)sectionLocationForRow:(int)arg1 inSection:(int)arg2;
- (NSRange)sectionsInRect:(CGRect)arg1;
- (void)setEstimatesRowHeights:(BOOL)arg1;
- (void)setHeight:(float)arg1 forRowAtIndexPath:(id)arg2;
- (void)setHeightForTableHeaderViewHiding:(float)arg1;
- (void)setMinimumRowHeight:(float)arg1;
- (void)setReorderedIndexPath:(id)arg1;
- (void)setTableBottomPadding:(float)arg1;
- (void)setTableSidePadding:(float)arg1;
- (void)setTableTopPadding:(float)arg1;
- (BOOL)shouldStripHeaderTopPaddingForSection:(int)arg1;
- (float)tableBottomPadding;
- (void)tableFooterHeightDidChangeToHeight:(float)arg1;
- (void)tableHeaderHeightDidChangeToHeight:(float)arg1;
- (float)tableSidePadding;
- (float)tableTopPadding;
- (void)tableViewWidthDidChangeToWidth:(float)arg1;
- (id)targetIndexPathForPoint:(CGPoint)arg1;

@end
