//
//  UPArpuInterstitialDelegate.h
//  UpArpuInterstitial
//
//  Created by Martin Lau on 21/09/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuInterstitialDelegate_h
#define UPArpuInterstitialDelegate_h
#import <UpArpuSDK/UpArpuSDK.h>
@protocol UPArpuInterstitialDelegate<UPArpuAdLoadingDelegate>
-(void) interstitialDidShowForPlacementID:(NSString*)placementID;
-(void) interstitialFailedToShowForPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) interstitialDidStartPlayingVideoForPlacementID:(NSString*)placementID;
-(void) interstitialDidEndPlayingVideoForPlacementID:(NSString*)placementID;
-(void) interstitialDidFailToPlayVideoForPlacementID:(NSString*)placementID error:(NSError*)error;
-(void) interstitialDidCloseForPlacementID:(NSString*)placementID;
-(void) interstitialDidClickForPlacementID:(NSString*)placementID;
@end

#endif /* UPArpuInterstitialDelegate_h */
