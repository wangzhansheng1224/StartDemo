//
//  PickeViewController.h
//  FMRecordVideo
//
//  Created by 王战胜 on 2017/11/16.
//  Copyright © 2017年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CaptureMode) {
    CaptureModeVideo = 0,
    CaptureModePhoto
};
@interface PickerViewController : UIImagePickerController
@property (nonatomic, copy) void (^PickPicture)(UIImage *picture);
- (instancetype)initWithCaptureMode:(CaptureMode)mode;
@end
