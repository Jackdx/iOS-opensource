//
//  UIViewController.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/8.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DUIViewController : UIResponder

@property(null_resettable, nonatomic,strong) UIView *view;

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);
- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

- (void)loadView;
- (void)loadViewIfNeeded NS_AVAILABLE_IOS(9_0);
@end
