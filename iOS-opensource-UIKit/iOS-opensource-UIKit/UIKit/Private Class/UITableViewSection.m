//
//  UITableViewSection.m
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UITableViewSection.h"

@implementation UITableViewSection

+ (UITableViewSection *)sectionWithRows:(NSArray *)rows
{
    UITableViewSection *section = [[self alloc] init];
    [section setRows:rows];
    return section;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.headerView = [aDecoder decodeObjectForKey:@"UITableSectionHeaderView"];
        self.headerTitle = [aDecoder decodeObjectForKey:@"UITableSectionHeaderTitle"];
        self.footerView = [aDecoder decodeObjectForKey:@"UITableSectionFooterView"];
        self.footerTitle = [aDecoder decodeObjectForKey:@"UITableSectionFooterTitle"];
        self.rows = [aDecoder decodeObjectForKey:@"UITableSectionRows"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.headerView) {
        [aCoder encodeObject:self.headerView forKey:@"UITableSectionHeaderView"];
    }
    if (self.headerTitle) {
        [aCoder encodeObject:self.headerTitle forKey:@"UITableSectionHeaderTitle"];
    }
    if (self.footerView) {
        [aCoder encodeObject:self.footerView forKey:@"UITableSectionFooterView"];
    }
    if (self.footerTitle) {
        [aCoder encodeObject:self.headerView forKey:@"UITableSectionFooterTitle"];
    }
    if (self.rows) {
        [aCoder encodeObject:self.rows forKey:@"UITableSectionRows"];
    }
}
@end
