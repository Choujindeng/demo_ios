//
//  UPArpuAdManager.h
//  UpArpuSDK
//
//  Created by Martin Lau on 04/05/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UPArpuNativeADView;
@class UPArpuNativeADConfiguration;
@protocol UPArpuNativeADDelegate;
@interface UPArpuAdManager : NSObject
+(instancetype) sharedManager;
-(void) loadADWithPlacementID:(NSString*)placementID customData:(NSDictionary*)customData delegate:(id<UPArpuNativeADDelegate>)delegate;
/**
 * This method uses the renderingViewClass you specify in the configuration to create an instance and:
    1) returns it(for networks Facebook, Inmobi, Mobvista, Admob, Flurry, Applovin) or
    2) adds it to a superView and returns the super view instead(for network Mopub).
 * To retrieve the instance of the class you specify as the rendering view class, cast the returned view to UPArpuNativeADView and call its embededAdView method(although the view returned might not be of class UPArpuNativeADView).
 */
-(__kindof UIView*) retriveAdViewWithPlacementID:(NSString*)placementID configuration:(UPArpuNativeADConfiguration*)configuration;
-(void) clearCache;
#pragma mark - offer extraction
-(BOOL) adReadyForPlacementID:(NSString*)placementID;
@end
