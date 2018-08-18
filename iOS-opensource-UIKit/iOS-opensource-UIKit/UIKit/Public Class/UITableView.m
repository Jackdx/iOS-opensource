//
//  UITableView.m
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UITableView.h"
#import "UITableViewRowData.h"

@interface DUITableView()
{
    NSMutableArray *_visibleCells; // 可见的cells数组，元素为UITableViewCell
    NSMutableArray *_selectedIndexPaths; // 选中的IndexPaths数组，元素为NSIndexPath
    
    UITableViewRowData *_rowData; // 此类的作用是把数据处理封装起来
    
    UIView *_tableHeaderBackgroundView; // tableHeader的BackgroundView
    
    
    NSMutableDictionary *_headerFooterClassDict;
    NSMutableDictionary *_headerFooterNibMap;
    
    NSMutableDictionary *_cellClassDict;
    NSMutableDictionary *_nibMap;
    
    NSMutableDictionary *_reusableHeaderFooterViews;
    NSMutableDictionary *_reusableTableCells;
    
    struct {
        unsigned int dataSourceNumberOfRowsInSection : 1; // 对应方法 - (NSInteger)numberOfRowsInSection:(NSInteger)section;
        unsigned int dataSourceCellForRow : 1;
        unsigned int dataSourceNumberOfSectionsInTableView : 1; // 对应属性numberOfSections
        unsigned int dataSourceTitleForHeaderInSection : 1;
        unsigned int dataSourceTitleForFooterInSection : 1;
        unsigned int dataSourceDetailTextForHeaderInSection : 1;
        unsigned int dataSourceCommitEditingStyle : 1;
        unsigned int dataSourceSectionIndexTitlesForTableView : 1;
        unsigned int dataSourceSectionForSectionIndexTitle : 1;
        unsigned int dataSourceCanEditRow : 1;
        unsigned int dataSourceCanMoveRow : 1;
        unsigned int dataSourceCanUpdateRow : 1;
        unsigned int dataSourceShouldShowMenu : 1;
        unsigned int dataSourceCanPerformAction : 1;
        unsigned int dataSourcePerformAction : 1;
        unsigned int dataSourceIndexPathForSectionIndexTitle : 1;
        unsigned int dataSourceWasNonNil : 1;
        unsigned int delegateEditingStyleForRowAtIndexPath : 1;
        unsigned int delegateTitleForDeleteConfirmationButtonForRowAtIndexPath : 1;
        unsigned int delegateEditActionsForRowAtIndexPath : 1;
        unsigned int delegateShouldIndentWhileEditing : 1;
        unsigned int dataSourceMoveRow : 1;
        unsigned int delegateCellForRow : 1;
        unsigned int delegateWillDisplayCell : 1;
        unsigned int delegateDidEndDisplayingCell : 1;
        unsigned int delegateDidEndDisplayingSectionHeader : 1;
        unsigned int delegateDidEndDisplayingSectionFooter : 1;
        unsigned int delegateHeightForRow : 1;
        unsigned int delegateHeightForSectionHeader : 1;
        unsigned int delegateTitleWidthForSectionHeader : 1;
        unsigned int delegateHeightForSectionFooter : 1;
        unsigned int delegateTitleWidthForSectionFooter : 1;
        unsigned int delegateEstimatedHeightForRow : 1;
        unsigned int delegateEstimatedHeightForSectionHeader : 1;
        unsigned int delegateEstimatedHeightForSectionFooter : 1;
        unsigned int delegateViewForHeaderInSection : 1;
        unsigned int delegateViewForFooterInSection : 1;
        unsigned int delegateDisplayedItemCountForRowCount : 1;
        unsigned int delegateDisplayStringForRowCount : 1;
        unsigned int delegateAccessoryTypeForRow : 1;
        unsigned int delegateAccessoryButtonTappedForRow : 1;
        unsigned int delegateWillSelectRow : 1;
        unsigned int delegateWillDeselectRow : 1;
        unsigned int delegateDidSelectRow : 1;
        unsigned int delegateDidDeselectRow : 1;
        unsigned int delegateWillBeginEditing : 1;
        unsigned int delegateDidEndEditing : 1;
        unsigned int delegateWillMoveToRow : 1;
        unsigned int delegateIndentationLevelForRow : 1;
        unsigned int delegateWantsHeaderForSection : 1;
        unsigned int delegateHeightForRowsInSection : 1;
        unsigned int delegateMargin : 1;
        unsigned int delegateHeaderTitleAlignment : 1;
        unsigned int delegateFooterTitleAlignment : 1;
        unsigned int delegateFrameForSectionIndexGivenProposedFrame : 1;
        unsigned int delegateDidFinishReload : 1;
        unsigned int delegateHeightForHeader : 1;
        unsigned int delegateHeightForFooter : 1;
        unsigned int delegateViewForHeader : 1;
        unsigned int delegateViewForFooter : 1;
        unsigned int delegateCalloutTargetRectForCell : 1;
        unsigned int delegateShouldShowMenu : 1;
        unsigned int delegateCanPerformAction : 1;
        unsigned int delegatePerformAction : 1;
        unsigned int delegateWillBeginReordering : 1;
        unsigned int delegateDidEndReordering : 1;
        unsigned int delegateDidCancelReordering : 1;
        unsigned int delegateWillDisplayHeaderViewForSection : 1;
        unsigned int delegateWillDisplayFooterViewForSection : 1;
        unsigned int delegateShouldHighlightRow : 1;
        unsigned int delegateDidHighlightRow : 1;
        unsigned int delegateDidUnhighlightRow : 1;
        unsigned int delegateTitleForSwipeAccessory : 1;
        unsigned int delegateBackgroundColorForDeleteConfirmationButton : 1;
        unsigned int delegateBackgroundColorForSwipeAccessory : 1;
        unsigned int delegateDeleteConfirmationButton : 1;
        unsigned int delegateSwipeAccessory : 1;
        unsigned int delegateSwipeAccessoryPushed : 1;
        unsigned int delegateShouldDrawTopSeparatorForSection : 1;
        unsigned int delegateWillBeginSwiping : 1;
        unsigned int delegateDidEndSwiping : 1;
        unsigned int delegateCanFocusRow_deprecated : 1;
        unsigned int delegateCanFocusRow : 1;
        unsigned int delegateDidFocusRow : 1;
        unsigned int delegateDidUnfocusRow : 1;
        unsigned int delegateShouldChangeFocusedItem : 1;
        unsigned int delegateIndexPathForPreferredFocusedItem : 1;
        unsigned int delegateShouldUpdateFocusFromRowAtIndexPathToView : 1;
        unsigned int delegateIndexPathForPreferredFocusedView : 1;
        unsigned int delegateShouldUpdateFocusInContext : 1;
        unsigned int delegateDidUpdateFocusInContext : 1;
        unsigned int delegateTemplateLayoutCell : 1;
        unsigned int delegateWillLayoutCellUsingTemplateLayoutCell : 1;
        unsigned int delegateWasNonNil : 1;
        unsigned int style : 1;  // 已使用
        unsigned int separatorStyle : 3;  // 已使用
        unsigned int wasEditing : 1;
        unsigned int isEditing : 1;
        unsigned int isEditingAllRows : 1;
        unsigned int scrollsToSelection : 1;
        unsigned int reloadSkippedDuringSuspension : 1;
        unsigned int updating : 1;
        unsigned int displaySkippedDuringSuspension : 1;
        unsigned int needsReload : 1;
        unsigned int updatingVisibleCellsManually : 1;
        unsigned int scheduledUpdateVisibleCells : 1;
        unsigned int scheduledUpdateVisibleCellsFrames : 1;
        unsigned int warnForForcedCellUpdateDisabled : 1;
        unsigned int displayTopSeparator : 1;
        unsigned int countStringInsignificantRowCount : 4;
        unsigned int needToAdjustExtraSeparators : 1;
        unsigned int overlapsSectionHeaderViews : 1;
        unsigned int ignoreTouchSelect : 1;
        unsigned int lastHighlightedRowActive : 1;
        unsigned int reloading : 1;
        unsigned int allowsSelection : 1;
        unsigned int allowsSelectionDuringEditing : 1;
        unsigned int allowsMultipleSelection : 1;
        unsigned int allowsMultipleSelectionDuringEditing : 1;
        unsigned int showsSelectionImmediatelyOnTouchBegin : 1;
        unsigned int indexHidden : 1;
        unsigned int indexHiddenForSearch : 1;
        unsigned int defaultShowsHorizontalScrollIndicator : 1;
        unsigned int defaultShowsVerticalScrollIndicator : 1;
        unsigned int sectionIndexTitlesLoaded : 1;
        unsigned int tableHeaderViewShouldAutoHide : 1;
        unsigned int tableHeaderViewIsHidden : 1;
        unsigned int tableHeaderViewWasHidden : 1;
        unsigned int tableHeaderViewShouldPin : 1;
        unsigned int hideScrollIndicators : 1;
        unsigned int sendReloadFinished : 1;
        unsigned int keepFirstResponderWhenInteractionDisabled : 1;
        unsigned int keepFirstResponderVisibleOnBoundsChange : 1;
        unsigned int dontDrawTopShadowInGroupedSections : 1;
        unsigned int forceStaticHeadersAndFooters : 1;
        unsigned int displaysCellContentStringsOnTapAndHold : 1;
        unsigned int displayingCellContentStringCallout : 1;
        unsigned int longPressAutoscrollingActive : 1;
        unsigned int adjustsRowHeightsForSectionLocation : 1;
        unsigned int inInit : 1;
        unsigned int inSetBackgroundColor : 1;
        unsigned int inCreateTemplateCell : 1;
        unsigned int usingCustomBackgroundView : 1;
        unsigned int rowDataIndexPathsAreValidForCurrentCells : 1;
        unsigned int committingDelete : 1;
        unsigned int didReloadWhileCommittingDelete : 1;
        unsigned int editingForSwipeDelete : 1;
        unsigned int wasEditingForSwipeToDeleteBeforeSuspendedReload : 1;
        unsigned int ignorePinnedTableHeaderUpdates : 1;
        unsigned int navigationGestureWasEnabledBeforeSwipeToDelete : 1;
        unsigned int didDisableNavigationGesture : 1;
        unsigned int separatorsDrawAsOverlay : 1;
        unsigned int swipeToDeleteRowIsBeingDeleted : 1;
        unsigned int drawsSeparatorAtTopOfSections : 1;
        unsigned int separatorBackdropOverlayBlendMode : 3;
        unsigned int separatorsDrawInVibrantLightMode : 1;
        unsigned int wrapCells : 1;
        unsigned int showingIndexIndicatorOverlay : 1;
        unsigned int showingIndexSelectionOverlay : 1;
        unsigned int loadingOffscreenViews : 1;
        unsigned int externalScreenHasTouch : 1;
        unsigned int ignoringWheelEventsOnIndexOverlayIndicator : 1;
        unsigned int deleteCancelationAnimationInProgress : 1;
        unsigned int manuallyManagesSwipeUI : 1;
        unsigned int allowsReorderingWhenNotEditing : 1;
        unsigned int needsDeleteConfirmationCleanup : 1;
        unsigned int resetContentOffsetAfterLayout : 1;
        unsigned int cellsSelfSize : 1;
        unsigned int usingCustomLayoutMargins : 1;
        unsigned int settingDefaultLayoutMargins : 1;
        unsigned int deallocating : 1;
        unsigned int updateFocusAfterItemAnimations : 1;
        unsigned int updateFocusAfterLoadingCells : 1;
        unsigned int remembersLastFocusedIndexPath : 1;
        unsigned int cellLayoutMarginsFollowReadableWidth : 1;
        unsigned int sectionContentInsetFollowsLayoutMargins : 1;
    } _tableFlags;
    
    int _tableReloadingSuspendedCount;
}




@end

@implementation DUITableView
@synthesize delegate = _delegate;

#pragma mark - public func
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    // 待实现
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)reloadData
{
    
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    [self _ensureRowDataIsLoaded];
    return [_rowData numberOfRowsInSection:section];
}
// dequeue模块
- (UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier
{
    return (UITableViewHeaderFooterView *)[self _dequeueReusableViewOfType:2 withIdentifier:identifier];
}
- (nullable __kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    return (__kindof UITableViewCell *)[self _dequeueReusableViewOfType:1 withIdentifier:identifier];
}
- (__kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    // 待实现
    /*
    UITableViewCell *dequeueReusableCell = [self dequeueReusableCellWithIdentifier:identifier];
    if (dequeueReusableCell == nil) {
        // NSAssertionHandler直接崩溃
    }
    [_delegate tableView:self heightForRowAtIndexPath:indexPath];
    return dequeueReusableCell;
     */
    return nil;
}
- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateSections:sections updateAction:0 withRowAnimation:animation headerFooterOnly:NO];
}
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateSections:sections updateAction:1 withRowAnimation:animation headerFooterOnly:NO];
}
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateSections:sections updateAction:2 withRowAnimation:animation headerFooterOnly:NO];
}
- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateRowsAtIndexPaths:indexPaths updateAction:0 withRowAnimation:animation];
}
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateRowsAtIndexPaths:indexPaths updateAction:1 withRowAnimation:animation];
}
- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateRowsAtIndexPaths:indexPaths updateAction:2 withRowAnimation:animation];
}
- (void)reloadSectionIndexTitles
{
    // 待实现
}
#pragma mark - rewrite func
- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame style:UITableViewStylePlain];
}


#pragma mark - protocol func

#pragma mark - private func
- (void)_suspendReloads
{
    _tableReloadingSuspendedCount = _tableReloadingSuspendedCount + 1;
}
- (id)_templateLayoutCellForCellsWithReuseIdentifier:(NSString *)identifier
{
    // 待实现
    return nil;
}

- (void)_setupDefaultHeights
{
    // 待实现
}
- (void)_reloadSectionHeaderFooters:(id)arg1 withRowAnimation:(UITableViewRowAnimation)animation
{
    [self _updateSections:arg1 updateAction:2 withRowAnimation:animation headerFooterOnly:YES];
}
- (void)_updateRowsAtIndexPaths:(id)arg1 updateAction:(int)arg2 withRowAnimation:(int)arg3
{
    // 待实现
}
- (void)_updateSections:(id)arg1 updateAction:(int)arg2 withRowAnimation:(int)arg3 headerFooterOnly:(BOOL)arg4
{
    // 待实现
}
- (void)_addContentSubview:(UIView *)contentSubview atBack:(BOOL)atBack
{
    // 待实现
}
- (void)_setupCellAnimations
{
    // 待实现
    /*
    [self _updateVisibleCellsNow:NO isRecursive:NO];
    [self _suspendReloads];
     */
}
// 作用：真正的注册方法
- (void)_registerThing:(id)arg1 asNib:(BOOL)asNib forViewType:(int)type withReuseIdentifer:(NSString *)identifier
{
    // 待实现
    /*
    NSMutableDictionary *clsMap = [self _classMapForType:type];
    NSMutableDictionary *nibMap = [self _nibMapForType:type];
    if (asNib) {
        clsMap = [self _nibMapForType:type];
        nibMap = [self _classMapForType:type];
    }
    [nibMap removeObjectForKey:identifier];
    if (arg1) {
        [clsMap setObject:arg1 forKey:identifier];
    }
    else
    {
        [clsMap removeObjectForKey:identifier];
    }
     */
    
}
- (void)_configureBackgroundView
{
    // 待实现
}
- (UITableViewRowData *)_rowData
{
    return _rowData;
}
- (void)_updateVisibleCellsNow:(BOOL)arg1 isRecursive:(BOOL)arg2
{
    // 待实现
}
- (void)_updateVisibleCellsImmediatelyIfNecessary
{
    // 待实现
    // 作用：如果有必要，立即更新可见的cells
}
- (NSArray<UITableViewCell *> *)_visibleCells
{
    [self _updateVisibleCellsImmediatelyIfNecessary];
    return [_visibleCells copy];
}
- (void)_reloadDataIfNeeded
{
    // 待实现
    /*
    if ((_tableFlags.needsReload == 0) && (_tableReloadingSuspendedCount == 0)) {
        [self reloadData];
    }
     */
}

- (void)_ensureRowDataIsLoaded
{
    // 作用：保证RowData加载
    if (_rowData == nil) {
        [self _updateRowData];
    }
}
// 作用：更新RowData
- (void)_updateRowData
{
    // 待实现
    /*
    if (_rowData == nil) {
        _rowData = [[UITableViewRowData alloc] initWithTableView:self];
    }
     */
}
// 作用：真正的复用方法
- (UIView *)_dequeueReusableViewOfType:(int)type withIdentifier:(NSString *)identifier
{
    // 待实现
    /*
     UIView *dequeueReusableView = [[self _cellReuseMapForType:type] objectForKey:identifier];
     return dequeueReusableView;
     */
    return nil;
}
#pragma mark - need obvious realize set-get func
- (UIView *)_tableHeaderBackgroundView
{
    return _tableHeaderBackgroundView;
}
- (NSArray<NSIndexPath *> *)indexPathsForVisibleRows
{
    // 待实现
    return nil;
}
- (NSInteger)numberOfSections
{
    [self _ensureRowDataIsLoaded];
    return [_rowData numberOfSections];
}
- (NSIndexPath *)indexPathForSelectedRow
{
    // 待实现
    return nil;
}
- (NSArray<NSIndexPath *> *)indexPathsForSelectedRows
{
    if (_selectedIndexPaths.count) {
        return [_selectedIndexPaths copy];
    }
    return nil;
}
- (NSArray<UITableViewCell *> *)visibleCells
{
    return [self _visibleCells];
}
- (void)setDataSource:(id<UITableViewDataSource>)dataSource
{
    // 待实现
    /*
    _dataSource = dataSource;
    _tableFlags.dataSourceNumberOfSectionsInTableView = [_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)];
    _tableFlags.dataSourceTitleForHeaderInSection = [_dataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)];
    _tableFlags.dataSourceTitleForFooterInSection = [_dataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)];
    _tableFlags.dataSourceCommitEditingStyle = [_dataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)];
    _tableFlags.dataSourceCanEditRow = [_dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)];
     */
    // 其他UITableViewDataSource协议略
}
- (void)setDelegate:(id<UITableViewDelegate>)newDelegate
{
    // 待实现
    /*
    [super setDelegate:newDelegate];
    _tableFlags.delegateHeightForRow = [newDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)];
    _tableFlags.delegateHeightForHeader = [newDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)];
    _tableFlags.delegateHeightForFooter = [newDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)];
    _tableFlags.delegateViewForHeaderInSection = [newDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)];
    _tableFlags.delegateViewForFooterInSection = [newDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)];
    _tableFlags.delegateWillSelectRow = [newDelegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)];
    _tableFlags.delegateDidSelectRow = [newDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)];
    _tableFlags.delegateWillDeselectRow = [newDelegate respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)];
    _tableFlags.delegateDidDeselectRow = [newDelegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)];
    _tableFlags.delegateWillBeginEditing = [newDelegate respondsToSelector:@selector(tableView:willBeginEditingRowAtIndexPath:)];
    _tableFlags.delegateDidEndEditing = [newDelegate respondsToSelector:@selector(tableView:didEndEditingRowAtIndexPath:)];
    _tableFlags.delegateTitleForDeleteConfirmationButtonForRowAtIndexPath = [newDelegate respondsToSelector:@selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:)];
    // 其他UITableViewDelegate协议略
     */
}
- (void)setTableHeaderView:(UIView *)tableHeaderView
{
    // 待实现
}
- (void)setTableFooterView:(UIView *)tableFooterView
{
    // 待实现
}

- (UITableViewStyle)style
{
    return _tableFlags.style;
}
- (UITableViewCellSeparatorStyle)separatorStyle
{
    return _tableFlags.separatorStyle;
}
- (void)setSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
{
    // 待实现
}
- (void)setSeparatorColor:(UIColor *)separatorColor
{
    // 待实现
}
- (void)setBackgroundView:(UIView *)backgroundView
{
   // 待实现
    /*
    if (_backgroundView) {
        [_backgroundView removeFromSuperview];
        _backgroundView = backgroundView;
        [self _configureBackgroundView];
    }
     */
}

- (UIEdgeInsets)separatorInset
{
    // 待实现
    return UIEdgeInsetsZero;
}
- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
    // 待实现
}




















#pragma mark - register模块
- (void)registerClass:(nullable Class)aClass forHeaderFooterViewReuseIdentifier:(NSString *)identifier
{
    if ([identifier length] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a valid reuse identifier to -[UITableView %s]",__func__];
    }
    if ((aClass) && ([aClass isSubclassOfClass:[UITableViewHeaderFooterView class]] == NO) && ([UITableViewHeaderFooterView class]) != aClass) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a class of kind %@", [UITableViewHeaderFooterView class]];
    }
    [self _registerThing:aClass asNib:NO forViewType:2 withReuseIdentifer:identifier];
}
- (void)registerNib:(nullable UINib *)nib forHeaderFooterViewReuseIdentifier:(NSString *)identifier
{
    if ([identifier length] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a valid reuse identifier to -[UITableView %s]",__func__];
    }
    [self _registerThing:nib asNib:YES forViewType:2 withReuseIdentifer:identifier];
}
- (void)registerClass:(nullable Class)aClass forCellReuseIdentifier:(NSString *)identifier
{
    if ([identifier length] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a valid reuse identifier to -[UITableView %s]",__func__];
    }
    if ((aClass) && ([aClass isSubclassOfClass:[UITableViewCell class]] == NO) && ([UITableViewCell class]) != aClass) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a class of kind %@", [UITableViewCell class]];
    }
    [self _registerThing:aClass asNib:NO forViewType:1 withReuseIdentifer:identifier];
}
- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier
{
    if ([identifier length] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"must pass a valid reuse identifier to -[UITableView %s]",__func__];
    }
    [self _registerThing:nib asNib:YES forViewType:1 withReuseIdentifer:identifier];
}
- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section
{
   return [self _visibleHeaderViewForSection:section];
}
- (UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section
{
    return nil;
}


- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell
{
    return nil;
}


// 作用：根据type返回class字典
- (NSMutableDictionary *)_classMapForType:(int)type
{
    if (type == 2) {  // UITableViewHeaderFooterView
        if (_headerFooterClassDict == nil) {
            _headerFooterClassDict = [[NSMutableDictionary alloc] init];
        }
        return _headerFooterClassDict;
    }
    else
    {
        if (type != 1) {
            // NSAssertionHandler 报错
        }
        if (_cellClassDict == nil) {
            _cellClassDict = [[NSMutableDictionary alloc] init];
        }
        return _cellClassDict;
    }
}
- (NSMutableDictionary *)_nibMapForType:(int)type
{
    if (type == 2) {  // UITableViewHeaderFooterView
        if (_headerFooterNibMap == nil) {
            _headerFooterNibMap = [[NSMutableDictionary alloc] init];
        }
        return _headerFooterNibMap;
    }
    else
    {
        if (type != 1) {
            // NSAssertionHandler 报错
        }
        if (_nibMap == nil) {
            _nibMap = [[NSMutableDictionary alloc] init];
        }
        return _nibMap;
    }
}
- (NSMutableDictionary *)_cellReuseMapForType:(int)type
{
    if (type == 2) {  // UITableViewHeaderFooterView
        if (_reusableHeaderFooterViews == nil) {
            _reusableHeaderFooterViews = [[NSMutableDictionary alloc] init];
        }
        return _reusableHeaderFooterViews;
    }
    else
    {
        if (type != 1) {
            // NSAssertionHandler 报错
        }
        return _reusableTableCells;
    }
}

- (UITableViewHeaderFooterView *)_visibleHeaderViewForSection:(NSInteger)section
{
    return nil;
}








@end
