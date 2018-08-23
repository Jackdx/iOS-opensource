//
//  UINavigationItem.m
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/22.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UINavigationItem.h"
#import "UINavigationItemView.h"

@interface DUINavigationItem ()
{
    UIView *_backButtonView;
    UIView *_defaultTitleView;
}

@end

@implementation DUINavigationItem
#pragma mark - public func
- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        if (title) {
            NSCharacterSet *whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            title = [title stringByTrimmingCharactersInSet:whitespaceAndNewlineCharacterSet];
        }
        _title = title;
    }
    return self;
}
- (void)setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
    [self setObject:item forLeftRightKeyPath:@"_leftBarButtonItem" animated:animated];
}
- (void)setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
    [self setObject:item forLeftRightKeyPath:@"_rightBarButtonItem" animated:animated];
}
- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated
{
    if (items) {
        if ((_leftBarButtonItems == nil) || ([_leftBarButtonItems isEqualToArray:items] == NO)) {
            [self setObject:items forLeftRightKeyPath:@"_leftBarButtonItems" animated:animated];
        }
    }
    else
    {
        [self setObject:nil forLeftRightKeyPath:@"_leftBarButtonItems" animated:animated];
    }
}
- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items animated:(BOOL)animated
{
    if (items) {
        if ((_rightBarButtonItems == nil) || ([_rightBarButtonItems isEqualToArray:items] == NO)) {
            [self setObject:items forLeftRightKeyPath:@"_rightBarButtonItems" animated:animated];
        }
    }
    else
    {
        [self setObject:nil forLeftRightKeyPath:@"_rightBarButtonItems" animated:animated];
    }
}
#pragma mark - rewrite func
- (void)dealloc
{
    [self _removeTitleAndButtonViews];
}

#pragma mark - protocol func

#pragma mark - private func
- (void)_updateBarItemOwnersTo:(id)arg1
{
    
}
- (UIView *)_defaultTitleView
{
    if (_defaultTitleView == nil) {
        if (self.title.length) {
            _defaultTitleView = [[UINavigationItemView alloc] initWithNavigationItem:self];
        }
    }
    return _defaultTitleView;
}
- (UIView *)existingBackButtonView
{
    return _backButtonView;
}
- (UIView *)backButtonView
{
    return nil;
}
- (void)_removeBackButtonView
{
    [_backButtonView removeFromSuperview];
    _backButtonView = nil;
}
- (void)_removeTitleAndButtonViews
{
    [self _removeBackButtonView];
    [self.titleView removeFromSuperview];
    [_defaultTitleView removeFromSuperview];
    _defaultTitleView = nil;
}
- (void)setObject:(id)items forLeftRightKeyPath:(NSString *)keyPath animated:(BOOL)animated
{
//    id item = [self valueForKey:keyPath];
//    if (item != items) {
//        [self _updateBarItemOwnersTo:nil];
//        [self setValue:items forKey:keyPath];
//        if (1) {
//            NSArray *arr1 = @[@"_leftBarButtonItem", @"_rightBarButtonItem", @"_customLeftView", @"_customRightView", @"_customLeftViews", @"_customRightViews"];
//            NSArray *arr2 = @[@"_customLeftView", @"_customRightView", @"_leftBarButtonItem", @"_rightBarButtonItem", @"_leftBarButtonItems", @"_rightBarButtonItems"];
//            NSDictionary *dic = [[NSDictionary alloc] initWithObjects:arr1 forKeys:arr2];
//        }
//    }
}

#pragma mark - need obvious realize set-get func
- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems
{
    [self setLeftBarButtonItems:leftBarButtonItems animated:NO];
}
- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems
{
    [self setRightBarButtonItems:rightBarButtonItems animated:NO];
}
- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    [self setLeftBarButtonItem:leftBarButtonItem animated:NO];
}
- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    [self setRightBarButtonItem:rightBarButtonItem animated:NO];
}
@end
