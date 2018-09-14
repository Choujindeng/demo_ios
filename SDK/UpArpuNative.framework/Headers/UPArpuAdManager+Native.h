//
//  UPArpuAdManager+Native.h
//  UpArpuNative
//
//  Created by Martin Lau on 07/07/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UpArpuSDK/UpArpuSDK.h>
@class UPArpuNativeADView;
@class UPArpuNativeADConfiguration;
@interface UPArpuAdManager (Native)
-(BOOL) nativeAdReadyForPlacementID:(NSString*)placementID;
/**
 * This method uses the renderingViewClass you specify in the configuration to create an instance and:
 1) returns it(for networks Facebook, Inmobi, Mintegral, Admob, Flurry, Applovin) or
 2) adds it to a superView and returns the super view instead(for network Mopub).
 * To retrieve the instance of the class you specify as the rendering view class, cast the returned view to UPArpuNativeADView and call its embededAdView method(the view returned might not be of class UPArpuNativeADView).
 */
-(__kindof UIView*) retriveAdViewWithPlacementID:(NSString*)placementID configuration:(UPArpuNativeADConfiguration*)configuration;
@end
