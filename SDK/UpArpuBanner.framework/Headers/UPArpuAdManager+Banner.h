//
//  UPArpuAdManager+Banner.h
//  UpArpuBanner
//
//  Created by Martin Lau on 18/09/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UpArpuSDK/UpArpuSDK.h>

@class UPArpuBannerView;
@interface UPArpuAdManager (Banner)
-(BOOL) bannerAdReadyForPlacementID:(NSString*)placementID;
/*
 nil will be returned if you try to show banner ad for the placementID if it's not ready.
 */
-(nullable UPArpuBannerView*)retrieveBannerViewForPlacementID:(NSString*)placementID;
@end
