//
//  UITableViewHeaderFooterView.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/13.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DUITableViewHeaderFooterView : UIView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly, strong, nullable) UILabel *textLabel;
@property (nonatomic, readonly, strong, nullable) UILabel *detailTextLabel; // only supported for headers in grouped style

@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, strong, nullable) UIView *backgroundView;

@property (nonatomic, readonly, copy, nullable) NSString *reuseIdentifier;

- (void)prepareForReuse NS_REQUIRES_SUPER;  // if the view is reusable (has a reuse identifier), this is called just before the view is returned from the table view method dequeueReusableHeaderFooterViewWithIdentifier:.  If you override, you MUST call super.

@end
