//
//  UPSDK.h
//  UpArpuSDK
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const UPADLoadingErrorDomain;
extern NSInteger const UPADLoadingErrorCodePlacementStrategyLoadingFailed;
extern NSInteger const UPADLoadingErrorCodeADOfferLoadingFailed;
extern NSInteger const UPADLoadingErrorCodePlacementStrategyNotFound;
extern NSInteger const UPADLoadingErrorCodeADOfferNotFound;
extern NSInteger const UPADLoadingErrorCodeShowIntervalWithinPlacementPacing;
extern NSInteger const UPADLoadingErrorCodeShowTimesExceedsHourCap;
extern NSInteger const UPADLoadingErrorCodeShowTimesExceedsDayCap;
extern NSInteger const UPADLoadingErrorCodeAdapterClassNotFound;
extern NSInteger const UPADLoadingErrorCodeADOfferLoadingTimeout;

@interface UPSDK : NSObject
+(instancetype)sharedInstance;
-(void) startWithAppID:(NSString*)appID appKey:(NSString*)appKey;
@property(nonatomic, readonly) NSString *appID;
@property(nonatomic, readonly) NSString *appKey;

-(NSString*)version;
@end
