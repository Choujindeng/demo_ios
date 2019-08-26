 //
//  UPArpuNativeSplashWrapper.h
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 2019/3/19.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const kUPArpuNativeSplashShowingExtraRecommendTitleKey;
extern NSString *const kUPArpuNativeSplashShowingExtraCTAButtonBackgroundColorKey;
extern NSString *const kUPArpuNativeSplashShowingExtraContainerViewKey;
extern NSString *const kUPArpuNativeSplashShowingExtraCountdownIntervalKey;
extern NSString *const kUPArpuNatievSplashShowingExtraStyleKey;

extern NSString *const kUPArpuNativeSplashShowingExtraStylePortrait;
extern NSString *const kUPArpuNativeSplashShowingExtraStyleLandscape;

@protocol UPArpuNativeSplashDelegate<NSObject>
-(void) finishLoadingNativeSplashAdForPlacementID:(NSString*)placementID;
-(void) failedToLoadNativeSplashAdForPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) didShowNativeSplashAdForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didClickNaitveSplashAdForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void) didCloseNativeSplashAdForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;

-(void) didShowNativeSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didClickNaitveSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
-(void) didCloseNativeSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra;
@end

@interface UPArpuNativeSplashWrapper : NSObject
+(instancetype) sharedWrapper;
+(void) loadNativeSplashAdWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra customData:(NSDictionary*)customData delegate:(id<UPArpuNativeSplashDelegate>)delegate;
+(void) showNativeSplashAdWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra delegate:(id<UPArpuNativeSplashDelegate>)delegate;
+(BOOL) splashNativeAdReadyForPlacementID:(NSString*)placementID;
@end
