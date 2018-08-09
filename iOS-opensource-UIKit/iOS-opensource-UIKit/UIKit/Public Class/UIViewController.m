//
//  UIViewController.m
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/8.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UIViewController.h"

@interface DUIViewController()
{
    
}

@end

@implementation DUIViewController
- (instancetype)init
{
    return [self initWithNibName:nil bundle:nil];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    [self _performCoordinatedPresentOrDismiss:completion animated:flag];
}
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [self _performCoordinatedPresentOrDismiss:completion animated:flag];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
//    [super dealloc];
}
- (UIView *)view
{
    [self loadViewIfRequired];
    return [self _existingView];
}
- (void)loadViewIfNeeded
{
    [self loadViewIfRequired];
}
- (void)loadView
{
    
}
#pragma mark - 私有方法
- (UIView *)_existingView
{
    return _view;
}
- (void)loadViewIfRequired
{
    if (_view == nil) {
        
    }
}
- (void)_performCoordinatedPresentOrDismiss:(void (^)(void))completion animated:(BOOL)flag
{
    
}
@end
