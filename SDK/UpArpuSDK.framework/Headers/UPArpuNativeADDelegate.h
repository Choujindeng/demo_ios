//
//  UPArpuNativeADDelegate.h
//  UpArpuSDK
//
//  Created by Martin Lau on 08/05/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuNativeADDelegate_h
#define UPArpuNativeADDelegate_h
@class UPArpuNativeADView;
@protocol UPArpuNativeADDelegate<NSObject>
-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID;
-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) exceptionDidOccurWithPlacementID:(NSString*)placementID;
-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID;
-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID;
-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID;
-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID;
@end
#endif /* UPArpuNativeADDelegate_h */
