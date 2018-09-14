//
//  UPArpuRewardedVideoDelegate.h
//  UpArpuSDK
//
//  Created by Martin Lau on 05/07/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuRewardedVideoDelegate_h
#define UPArpuRewardedVideoDelegate_h
#import <UpArpuSDK/UpArpuSDK.h>
@protocol UPArpuRewardedVideoDelegate<UPArpuAdLoadingDelegate>
-(void) rewardedVideoDidStartPlayingForPlacementID:(NSString*)placementID;
-(void) rewardedVideoDidEndPlayingForPlacementID:(NSString*)placementID;
-(void) rewardedVideoDidFailToPlayForPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) rewardedVideoDidCloseForPlacementID:(NSString*)placementID rewarded:(BOOL)rewarded;
-(void) rewardedVideoDidClickForPlacementID:(NSString*)placementID;
@end
#endif /* UPArpuRewardedVideoDelegate_h */
