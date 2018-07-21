//
//  UIImagePickerController.m
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import "UIImagePickerController.h"
#import "UIViewController+pri.h"
Boolean MGGetBoolAnswer(NSString *str)
{
    return YES;
}
@interface DUIImagePickerController ()
{
    struct {
        unsigned int visible : 1;
        unsigned int isCleaningUp : 1;
        unsigned int savingOptions : 3;
        unsigned int didRevertStatusBar : 1;
    } _imagePickerFlags;
    CGRect _cropRect;
    UIImage *_image;
    BOOL _previousStatusBarHidden;
    int _previousStatusBarStyle;
    NSMutableDictionary *_properties;
}
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
- (void)takePicture // 未完成
{
    if ([self _sourceTypeIsCamera]) {
        UIImagePickerController *picker = [self _cameraViewController];
//        [picker _takePicture];
    }
}
// 私有方法
- (BOOL)_sourceTypeIsCamera
{
    if ([self sourceType] == UIImagePickerControllerSourceTypeCamera) {
        return YES;
    }
    else
    {
        [NSException exceptionWithName:NSInvalidArgumentException reason:@"Source type must be UIImagePickerControllerSourceTypeCamera" userInfo:nil];
    }
    return NO;
}
- (UIImagePickerController *)_cameraViewController // 存疑？
{
    UIImagePickerController *vc = nil;
    if ([self _sourceTypeIsCamera]) {
        NSArray *vcs = [self viewControllers];
        if (vcs.count) {
            vc = vcs[0];
        }
    }
    return vc;
}
- (void)_populateArchivedChildViewControllers:(id)arg1
{
    [super _populateArchivedChildViewControllers:arg1];
    [arg1 removeAllObjects];
}
@end
