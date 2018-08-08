//
//  UITableViewRowData.m
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/8.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UITableViewRowData.h"

@implementation UITableViewRowData
- (id)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        _tableView = tableView;
    }
    
    return self;
}
@end
