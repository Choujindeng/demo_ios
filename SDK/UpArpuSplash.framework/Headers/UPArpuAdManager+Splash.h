//
//  UPArpuAdManager+Splash.h
//  UpArpuSplash
//
//  Created by Martin Lau on 2018/12/20.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UpArpuSDK/UpArpuSDK.h>
extern NSString *const kUPArpuSplashExtraCountdownKey;
extern NSString *const kUPArpuSplashExtraTolerateTimeoutKey;
extern NSString *const kUPArpuSplashExtraHideSkipButtonFlagKey;
extern NSString *const kUPArpuSplashExtraBackgroundImageKey;
extern NSString *const kUPArpuSplashExtraBackgroundColorKey;
extern NSString *const kUPArpuSplashExtraSkipButtonCenterKey;
extern NSString *const kUPArpuSplashExtraCustomSkipButtonKey;
extern NSString *const kUPArpuSplashExtraCanClickFlagKey;
@protocol UPArpuSplashDelegate;
@interface UPArpuAdManager (Splash)
-(void) loadADWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra customData:(NSDictionary*)customData delegate:(id<UPArpuSplashDelegate>)delegate window:(UIWindow*)window containerView:(UIView*)containerView;
@end
