//
//  UITableViewRowAction.m
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/13.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UITableViewRowAction.h"
#import "_UITableViewCellActionButton.h"
#import "UIColor+dx.h"

@interface DUITableViewRowAction ()
{
    _UITableViewCellActionButton *_button;
}
@property (getter=_handler, nonatomic, readonly) void (^handler)(UITableViewRowAction *, NSIndexPath *) ;

- (instancetype)_initWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void (^)(UITableViewRowAction *, NSIndexPath *))handler;
- (_UITableViewCellActionButton *)_button;

@end

@implementation DUITableViewRowAction

#pragma mark - public func

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void (^)(UITableViewRowAction *, NSIndexPath *))handler
{
    return [[self alloc] _initWithStyle:style title:title handler:handler];
}

#pragma mark - rewrite func
- (id)copyWithZone:(NSZone *)zone
{
    UITableViewRowAction *rowAction = [[self class] rowActionWithStyle:self.style title:self.title handler:self.handler];
    rowAction.backgroundColor = self.backgroundColor;
    return rowAction;
}

#pragma mark - private func
- (instancetype)_initWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void (^)(UITableViewRowAction *, NSIndexPath *))handler
{
    self = [super init];
    if (self) {
        _style = style;
        UIColor *color = nil;
        if (style != UITableViewRowActionStyleNormal) { // 红色删除样式
            if (style != UITableViewRowActionStyleDestructive) {// style>=2 的情况，故不赋值颜色
            }
            else
            {
                color = [UIColor systemRedColor];// rgba 分别为 1.000000 0.231373 0.188235 1.000000
            }
        }
        else // 默认的灰色样式
        {
            // rgba 分别为 0.780392 0.780392 0.800000 1.000000
            color = [UIColor colorWithRed:0.780392 green:0.780392 blue:0.8 alpha:1.0];
        }
        _backgroundColor = color;
        _title = title;
        _handler = handler;
    }
    return self;
}
- (_UITableViewCellActionButton *)_button
{
    return _button;
}
- (void)_setButton:(_UITableViewCellActionButton *)button
{
    _button = button;
}

@end
