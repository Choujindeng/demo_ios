//
//  MPNativeAdManager.h
//  MobPowerSDK
//
//  Created by Martin Lau on 2018/11/1.
//  Copyright © 2018 AutoMediation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPSDK.h"
#import "MPNativeAdDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface MPNativeAdManager : NSObject
+(instancetype)sharedManager;
/*
 Count has to be less than/equal to ten
 */
-(void) loadNativeAdsWithPlacementID:(NSString*)placementID count:(NSInteger)count category:(MPAdCategory)category delegate:(id<MPNativeAdDelegate>)delegate;
-(void) preloadNativeAdsWithPlacementID:(NSString*)placementID count:(NSInteger)count category:(MPAdCategory)category delegate:(id<MPNativeAdDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
