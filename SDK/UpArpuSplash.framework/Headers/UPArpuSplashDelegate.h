//
//  UPArpuSplashDelegate.h
//  UpArpuSplash
//
//  Created by Martin Lau on 2018/12/20.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuSplashDelegate_h
#define UPArpuSplashDelegate_h
#import <UpArpuSDK/UpArpuSDK.h>

extern NSString *const kUPArpuSplashDelegateExtraNetworkIDKey;
extern NSString *const kUPArpuSplashDelegateExtraAdSourceIDKey;
@protocol UPArpuSplashDelegate<UPArpuAdLoadingDelegate>
-(void)splashDidShowForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void)splashDidClickForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;
-(void)splashDidCloseForPlacementID:(NSString*)placementID DEPRECATED_ATTRIBUTE;

-(void)splashDidShowForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra;
-(void)splashDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra;
-(void)splashDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra;
@end
#endif /* UPArpuSplashDelegate_h */
