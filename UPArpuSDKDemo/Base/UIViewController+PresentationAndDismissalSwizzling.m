//
//  UIViewController+PresentationAndDismissalSwizzling.m
//  UPArpuSDKDemo
//
//  Created by Martin Lau on 2019/5/20.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import "UIViewController+PresentationAndDismissalSwizzling.h"
#import <objc/runtime.h>
NSString *const kUPArpuUIViewControllerPresentationNotification = @"com.uparpu.ViewControllerPresentation";
NSString *const kUPArpuUIViewControllerDismissalNotification = @"com.uparpu.ViewControllerDismissal";
NSString *const kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentingViewControllerKey = @"presenting_view_controller";
NSString *const kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentedViewControllerKey = @"presented_view_controller";
@implementation UIViewController (PresentationAndDismissalSwizzling)
+(void) swizzleMethods {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethodWithSelector:@selector(presentViewController:animated:completion:) swizzledMethodSelector:@selector(UPArpuSplash_presentViewController:animated:completion:) inClass:[UIViewController class]];
        [self swizzleMethodWithSelector:@selector(dismissViewControllerAnimated:completion:) swizzledMethodSelector:@selector(UPArpuSplash_dismissViewControllerAnimated:completion:) inClass:[UIViewController class]];
    });
}

+(void) swizzleMethodWithSelector:(SEL)originalSel swizzledMethodSelector:(SEL)swizzledMethodSel inClass:(Class)inClass {
    if (originalSel != NULL && swizzledMethodSel != NULL && inClass != nil) {
        Method originalMethod = class_getInstanceMethod(inClass, originalSel);
        Method swizzledMethod = class_getInstanceMethod(inClass, swizzledMethodSel);
        
        BOOL didAddMethod = class_addMethod(inClass, originalSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(inClass, swizzledMethodSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}

-(void)UPArpuSplash_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    [[NSNotificationCenter defaultCenter] postNotificationName:kUPArpuUIViewControllerPresentationNotification object:nil userInfo:@{kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentingViewControllerKey:self, kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentedViewControllerKey:viewControllerToPresent}];
    [self UPArpuSplash_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

-(void) UPArpuSplash_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [[NSNotificationCenter defaultCenter] postNotificationName:kUPArpuUIViewControllerDismissalNotification object:nil userInfo:@{kUPArpuUIViewControllerPresentationDismissalNotificationUserInfoPresentingViewControllerKey:self}];
    [self UPArpuSplash_dismissViewControllerAnimated:flag completion:completion];
}
@end
