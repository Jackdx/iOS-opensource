//
//  UITableViewController.m
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/10.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UITableViewController.h"
#import "_UIFilteredDataSource.h"

@interface DUITableViewController ()
{
    UITableViewStyle _tableViewStyle;
    _UIFilteredDataSource *_filteredDataSource;
    int _filteredDataType;
}


@end

@implementation DUITableViewController
#pragma mark - public function
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _tableViewStyle = style;
        [self _UITableViewControllerCommonInit];
    }
    return self;
}
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _UITableViewControllerCommonInit];
    }
    return self;
}

#pragma mark - private function
- (void)loadView
{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:_tableViewStyle];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.view = self.tableView;
}
- (instancetype)init
{
    return [self initWithStyle:UITableViewStylePlain];
}
- (void)dealloc
{
    
}

- (UITableView *)_existingTableView
{
    UIView *view = self.view;
    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)view;
        return tableView;
    }
    return nil;
}

#pragma mark - contain "_" private function
- (void)_UITableViewControllerCommonInit
{
    [self setClearsSelectionOnViewWillAppear:YES];
    if (_filteredDataSource == nil) {
        _filteredDataSource = [[_UIFilteredDataSource alloc] init];
    }
    _filteredDataType = 0;
}
@end
