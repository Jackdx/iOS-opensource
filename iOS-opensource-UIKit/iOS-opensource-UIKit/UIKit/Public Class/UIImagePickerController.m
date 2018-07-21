//
//  UIImagePickerController.m
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UIImagePickerController.h"
Boolean MGGetBoolAnswer(NSString *str)
{
    return YES;
}
@interface DUIImagePickerController ()

@end

@implementation DUIImagePickerController

+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType
{
    BOOL availble = YES;
    if (sourceType <= UIImagePickerControllerSourceTypeCamera) {
        if (sourceType) {
            if ((sourceType == UIImagePickerControllerSourceTypeCamera) && MGGetBoolAnswer(@"still-camera")) {
                availble = MGGetBoolAnswer(@"cameraRestriction")^1;
            }
            else
            {
                availble = NO;
            }
        }
    }
        else
        {
            if (sourceType != UIImagePickerControllerSourceTypeSavedPhotosAlbum)
            {
                availble = NO;
            }
        }
    return availble;
}
+ (BOOL)_isMediaTypeAvailable:(NSString *)arg1 forSource:(int)sourceType
{
    BOOL availble = YES;
    if ([self isSourceTypeAvailable:sourceType]) {
        if ([arg1 isEqualToString:@"kUTTypeImage"] == 0) {
            if ([arg1 isEqualToString:@"kUTTypeMovie"]) {
                if (sourceType == 1) {
                    availble = MGGetBoolAnswer(@"video-camera");
                }
                else
                {
                    availble = (sourceType & 0xfffffffffffffffd) == 0;
                }
            }
            else
            {
                if ([arg1 isEqualToString:@"com.apple.live-photo"]) {
                    availble = (sourceType != 1);
                }
                else {
                    availble = NO;
                }
            }
        }
    }
    else
    {
        availble = NO;
    }
    
    return availble;
}
+ (BOOL)_reviewCapturedItems
{
    return YES;
}
+ (NSArray<NSString *> *)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    NSArray *availableMediaTypes = nil;
    if ([self isSourceTypeAvailable:sourceType]) {
        BOOL isMediaAvai = [self _isMediaTypeAvailable:@"kUTTypeMovie" forSource:sourceType];
        if (isMediaAvai) {
            availableMediaTypes = [NSArray arrayWithObjects:@"public.image",@"public.movie",nil];
        }
    }
    return availableMediaTypes;
}
+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice
{
    return NO;
}
+ (NSArray<NSNumber *> *)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
    return nil;
}
+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
    return NO;
}
- (instancetype)init // 未完成
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    if (self.sourceType) {
        [aCoder encodeInteger:self.sourceType forKey:@"UISourceType"];
    }
    if ([self allowsImageEditing]) {
        [aCoder encodeBool:[self allowsImageEditing] forKey:@"UIAllowsImageEditing"];
    }
    if (self.mediaTypes) {
        [aCoder encodeObject:self.mediaTypes forKey:@"UIMediaTypes"];
    }
}
@end
