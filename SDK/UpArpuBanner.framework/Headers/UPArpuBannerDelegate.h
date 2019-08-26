//
//  UPArpuBannerDelegate.h
//  UpArpuSDK
//
//  Created by Martin Lau on 18/09/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuBannerDelegate_h
#define UPArpuBannerDelegate_h
#import <UpArpuSDK/UpArpuSDK.h>
@class UPArpuBannerView;

extern NSString *const kUPArpuBannerDelegateExtraNetworkIDKey;
extern NSString *const kUPArpuBannerDelegateExtraAdSourceIDKey;

@protocol UPArpuBannerDelegate<UPArpuAdLoadingDelegate>
-(void) bannerView:(UPArpuBannerView*)bannerView didShowAdWithPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) bannerView:(UPArpuBannerView*)bannerView didClickWithPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) bannerView:(UPArpuBannerView*)bannerView didCloseWithPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) bannerView:(UPArpuBannerView*)bannerView didAutoRefreshWithPlacement:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) bannerView:(UPArpuBannerView*)bannerView failedToAutoRefreshWithPlacementID:(NSString*)placementID error:(NSError*)error DEPRECATED_ATTRIBUTE;

-(void) bannerView:(UPArpuBannerView*)bannerView didShowAdWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) bannerView:(UPArpuBannerView*)bannerView didClickWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) bannerView:(UPArpuBannerView*)bannerView didCloseWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) bannerView:(UPArpuBannerView*)bannerView didAutoRefreshWithPlacement:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) bannerView:(UPArpuBannerView*)bannerView failedToAutoRefreshWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra error:(NSError*)error ;

@end
#endif /* UPArpuBannerDelegate_h */
