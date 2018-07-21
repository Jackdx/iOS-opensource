//
//  UITableViewSection.h
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UITableViewSection : NSObject <NSCoding>
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, retain) UIView *footerView;
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, copy) NSArray *rows;

+ (UITableViewSection *)sectionWithRows:(NSArray *)rows;

@end
