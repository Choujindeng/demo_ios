//
//  UPArpuSplashDelegate.h
//  UpArpuSplash
//
//  Created by Martin Lau on 2018/12/20.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuSplashDelegate_h
#define UPArpuSplashDelegate_h
#import "UPArpuAdLoadingDelegate.h"
@protocol UPArpuSplashDelegate<UPArpuAdLoadingDelegate>
-(void)splashDidShowForPlacementID:(NSString*)placementID;
-(void)splashDidClickForPlacementID:(NSString*)placementID;
-(void)splashDidCloseForPlacementID:(NSString*)placementID;
@end
#endif /* UPArpuSplashDelegate_h */
