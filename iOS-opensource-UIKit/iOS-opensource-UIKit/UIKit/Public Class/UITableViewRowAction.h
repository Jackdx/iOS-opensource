//
//  UITableViewRowAction.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/13.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DUITableViewRowAction : NSObject <NSCopying>

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(nullable NSString *)title handler:(void (^)(UITableViewRowAction *action, NSIndexPath *indexPath))handler;

@property (nonatomic, readonly) UITableViewRowActionStyle style;
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) UIColor *backgroundColor; // default background color is dependent on style
@property (nonatomic, copy, nullable) UIVisualEffect* backgroundEffect;

@end
