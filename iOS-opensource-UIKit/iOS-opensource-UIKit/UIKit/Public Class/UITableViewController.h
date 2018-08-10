//
//  UITableViewController.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/10.
//  Copyright © 2018年 Jack. All rights reserved.
//
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DUITableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, null_resettable) UITableView *tableView;
@property (nonatomic) BOOL clearsSelectionOnViewWillAppear NS_AVAILABLE_IOS(3_2); // defaults to YES. If YES, any selection is cleared in viewWillAppear:

@property (nonatomic, strong, nullable) UIRefreshControl *refreshControl NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;

@end
NS_ASSUME_NONNULL_END
