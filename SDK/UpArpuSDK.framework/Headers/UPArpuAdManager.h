//
//  UPArpuAdManager.h
//  UpArpuSDK
//
//  Created by Martin Lau on 04/05/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UPNativeADView;
@class UPNativeADConfiguration;
@protocol UPArpuNativeADDelegate;
@interface UPArpuAdManager : NSObject
+(instancetype) sharedManager;
-(void) loadADWithPlacementID:(NSString*)placementID delegate:(id<UPArpuNativeADDelegate>)delegate;
-(UPNativeADView*) retriveAdViewWithPlacementID:(NSString*)placementID configuration:(UPNativeADConfiguration*)configuration;

/**
 * Apply the app specified setting: upload the saved agent events if needed.
 */
-(void) applyAppSetting:(NSDictionary*)setting;

#pragma mark - offer extraction
-(BOOL) ADReadyForPlacementID:(NSString*)placementID;
@end
