//
//  UPArpuAdManager+RewardedVideo.h
//  UpArpuSDK
//
//  Created by Martin Lau on 05/07/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UpArpuSDK/UpArpuSDK.h>
#import "UPArpuRewardedVideoDelegate.h"
/*
 * A String, used for s2s
 */
extern NSString *const kUPArpuAdLoadingExtraCustomData;
/*
 * Third-party extra data
 */
extern NSString *const kUPArpuAdLoadingExtraKeywordKey;
extern NSString *const kUPArpuAdLoadingExtraUserDataKeywordKey;
extern NSString *const kUPArpuAdLoadingExtraUserIDKey;
extern NSString *const kUPArpuAdLoadingExtraLocationKey;
@interface UPArpuAdManager (RewardedVideo)
-(BOOL) rewardedVideoReadyForPlacementID:(NSString*)placementID;
-(void) showRewardedVideoWithPlacementID:(NSString*)placementID inViewController:(UIViewController*)viewController delegate:(id<UPArpuRewardedVideoDelegate>)delegate;

@end
