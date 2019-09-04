//
//  UPArpuNativeADDelegate.h
//  UpArpuSDK
//
//  Created by Martin Lau on 08/05/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuNativeADDelegate_h
#define UPArpuNativeADDelegate_h
#import <UpArpuSDK/UpArpuSDK.h>
@class UPArpuNativeADView;
extern NSString *const kUPArpuNativeDelegateExtraNetworkIDKey;
extern NSString *const kUPArpuNativeDelegateExtraAdSourceIDKey;
@protocol UPArpuNativeADDelegate<UPArpuAdLoadingDelegate>
-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didEnterFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didExitFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;

-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didEnterFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didExitFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra;
@end
#endif /* UPArpuNativeADDelegate_h */
