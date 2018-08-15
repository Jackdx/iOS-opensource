//
//  UIAlertControllerStackManager.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/15.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertControllerStackManager : NSObject
{
    NSMutableArray *_alertControllerStack;
    NSMutableArray *_hiddenAlertControllers;
}

+ (instancetype)sharedStackManager;

- (void)_addAlertControllerToStack:(id)arg1;
- (void)_alertControllerDidAppear:(id)arg1;
- (void)_alertControllerDidDisappear:(id)arg1;
- (BOOL)_alertControllerShouldBeTrackedInStack:(id)arg1;
- (int)_alertControllerStackCount;
- (void)_alertControllerWillAppear:(id)arg1;
- (void)_alertControllerWillDisappear:(id)arg1;
- (void)_didHideAlertController:(id)arg1;
- (void)_displayedAlertControllersChanged;
- (void)_hideStackedAlertControllers;
- (void)_removeAlertControllerFromStack:(id)arg1;
- (void)_showHiddenStackedAlertControllers;
- (id)_topAlertControllerInStack;
- (void)_willHideAlertController:(id)arg1;
- (void)_willShowAlertController:(id)arg1;
- (instancetype)init;
@end
