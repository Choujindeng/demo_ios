//
//  UIViewController+PresentationAndDismissalSwizzling.h
//  UPArpuSDKDemo
//
//  Created by Martin Lau on 2019/5/20.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kUPArpuUIViewControllerPresentationNotification;
extern NSString *const kUPArpuUIViewControllerDismissalNotification;
extern NSString *const kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentingViewControllerKey;
extern NSString *const kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentedViewControllerKey;
@interface UIViewController (PresentationAndDismissalSwizzling)
+(void) swizzleMethods;
@end
