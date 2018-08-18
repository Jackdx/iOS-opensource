//
//  UIGestureRecognizerDelegatePrivate.h
//  iOS-opensource-UIKit
//
//  Created by dengxiang on 2018/8/18.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIGestureRecognizerDelegatePrivate <UIGestureRecognizerDelegate>
@optional
-(BOOL)_gestureRecognizer:(id)arg1 shouldBeRequiredToFailByGestureRecognizer:(id)arg2;
-(BOOL)_gestureRecognizer:(id)arg1 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)arg2;
-(BOOL)_gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2;
-(BOOL)_gestureRecognizerShouldBegin:(id)arg1;
-(BOOL)_gestureRecognizer:(id)arg1 shouldRequireFailureOfGestureRecognizer:(id)arg2;
-(BOOL)_gestureRecognizer:(id)arg1 shouldReceivePress:(id)arg2;
-(BOOL)_gestureRecognizer:(id)arg1 canPreventGestureRecognizer:(id)arg2;
-(BOOL)_gestureRecognizer:(id)arg1 canBePreventedByGestureRecognizer:(id)arg2;

@end
