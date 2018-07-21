//
//  UIImagePickerController.h
//  iOS-opensource-UIKit
//
//  Created by Jack on 2018/7/21.
//  Copyright © 2018年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(2_0) __TVOS_PROHIBITED @interface DUIImagePickerController : UINavigationController <NSCoding>

@property(nullable,nonatomic,weak)      id <UINavigationControllerDelegate, UIImagePickerControllerDelegate> delegate;
@property(nonatomic)           UIImagePickerControllerSourceType     sourceType;                                                        // default value is UIImagePickerControllerSourceTypePhotoLibrary.
@property(nonatomic,copy)      NSArray<NSString *>                   *mediaTypes;
// default value is an array containing kUTTypeImage.
@property(nonatomic)           BOOL                                  allowsEditing NS_AVAILABLE_IOS(3_1);     // replacement for -allowsImageEditing; default value is NO.
@property(nonatomic)           BOOL                                  allowsImageEditing NS_DEPRECATED_IOS(2_0, 3_1);

// video properties apply only if mediaTypes includes kUTTypeMovie
@property(nonatomic)           NSTimeInterval                        videoMaximumDuration NS_AVAILABLE_IOS(3_1); // default value is 10 minutes.
@property(nonatomic)           UIImagePickerControllerQualityType    videoQuality NS_AVAILABLE_IOS(3_1);         // default value is UIImagePickerControllerQualityTypeMedium. If the cameraDevice does not support the videoQuality, it will use the default value.

// camera additions available only if sourceType is UIImagePickerControllerSourceTypeCamera.
@property(nonatomic)           BOOL                                  showsCameraControls NS_AVAILABLE_IOS(3_1);   // set to NO to hide all standard camera UI. default is YES
@property(nullable, nonatomic,strong) __kindof UIView                *cameraOverlayView  NS_AVAILABLE_IOS(3_1);   // set a view to overlay the preview view.
@property(nonatomic)           CGAffineTransform                     cameraViewTransform NS_AVAILABLE_IOS(3_1);   // set the transform of the preview view.

@property(nonatomic) UIImagePickerControllerCameraCaptureMode cameraCaptureMode NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraCaptureModePhoto
@property(nonatomic) UIImagePickerControllerCameraDevice      cameraDevice      NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraDeviceRear
@property(nonatomic) UIImagePickerControllerCameraFlashMode   cameraFlashMode   NS_AVAILABLE_IOS(4_0); // default is UIImagePickerControllerCameraFlashModeAuto.
// cameraFlashMode controls the still-image flash when cameraCaptureMode is Photo. cameraFlashMode controls the video torch when cameraCaptureMode is Video.

+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType;                 // returns YES if source is available (i.e. camera present)
+ (nullable NSArray<NSString *> *)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType; // returns array of available media types (i.e. kUTTypeImage)

+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice                   NS_AVAILABLE_IOS(4_0); // returns YES if camera device is available
+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice           NS_AVAILABLE_IOS(4_0); // returns YES if camera device supports flash and torch.
+ (nullable NSArray<NSNumber *> *)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice NS_AVAILABLE_IOS(4_0); // returns array of NSNumbers (UIImagePickerControllerCameraCaptureMode)

- (void)takePicture NS_AVAILABLE_IOS(3_1);
// programatically initiates still image capture. ignored if image capture is in-flight.
// clients can initiate additional captures after receiving -imagePickerController:didFinishPickingMediaWithInfo: delegate callback

- (BOOL)startVideoCapture NS_AVAILABLE_IOS(4_0);
- (void)stopVideoCapture  NS_AVAILABLE_IOS(4_0);

@end

NS_ASSUME_NONNULL_END
