//
//  MPNativeAdDelegate.h
//  MobPowerNative
//
//  Created by Martin Lau on 2018/10/29.
//  Copyright © 2018 AutoMediation. All rights reserved.
//

#ifndef MPNativeAdDelegate_h
#define MPNativeAdDelegate_h
@class MPNativeAd;
@protocol MPNativeAdDelegate<NSObject>
@optional;
-(void) didPreloadNativeAdsForPlacementID:(NSString*)placementID;
-(void) didLoadNativeAds:(NSArray<MPNativeAd*>*)ads forPlacementID:(NSString*)placementID;
-(void) failToLoadNativeAdsForPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) didShowNativeAd:(MPNativeAd*)nativeAd;
-(void) didClickNativeAd:(MPNativeAd*)nativeAd;
-(void) startClickNativeAd:(MPNativeAd*)nativeAd;
-(void) endClickNativeAd:(MPNativeAd*)nativeAd;
@end
#endif /* MPNativeAdDelegate_h */
