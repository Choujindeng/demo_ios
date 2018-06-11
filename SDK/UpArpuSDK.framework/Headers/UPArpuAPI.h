//
//  UPArpuAPI.h
//  UpArpuSDK
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
extern NSInteger const UPADLoadingErrorCodeSDKNotInitalizedProperly;
extern NSInteger const UPADLoadingErrorCodeDataConsentForbidden;

extern NSString *const UPSDKInitErrorDomain;
extern NSInteger const UPSDKInitErrorCodeDataConsentNotSet;
extern NSInteger const UPSDKInitErrorCodeDataConsentForbidden;

extern NSString *const kNetworkNameFacebook;
extern NSString *const kNetworkNameInmobi;
extern NSString *const kNetworkNameAdmob;
extern NSString *const kNetworkNameFlurry;
extern NSString *const kNetworkNameMobvista;
extern NSString *const kNetworkNameApplovin;
extern NSString *const kNetworkNameMopub;

extern NSString *const kAdmobConsentStatusKey;
extern NSString *const kAdmobUnderAgeKey;

extern NSString *const kApplovinConscentStatusKey;
extern NSString *const kApplovinUnderAgeKey;

typedef NS_ENUM(NSInteger, UpArpuDataConsentSet) {
    //Let it default to forbidden if not set
    UpArpuDataConsentSetUnknown = 0,
    UpArpuDataConsentSetPersonalized = 1,
    UpArpuDataConsentSetNonpersonalized = 2,
    UpArpuDataConsentSetForbidden = 3
};

@interface UPArpuAPI : NSObject
+(instancetype)sharedInstance;
/**
 * Inspect the error parameter to see what's the matter.
 */
-(BOOL) startWithAppID:(NSString*)appID appKey:(NSString*)appKey error:(NSError**)error;

/**
 * consentString might be nil.
 * This method is thread-safe.
 */
-(void) setDataConsentSet:(UpArpuDataConsentSet)dataConsentSet consentString:(NSDictionary<NSString*, NSString*>*)consentString;
/**
 * Whether the device is located in data protected area.
 */
-(BOOL)inDataProtectionArea;

/**
 * Show the data consent dialog using the specified constroller as the presenting view controller.
 * viewController might be nil, for which the root view controller of the window will be used instead.
 */
-(void) presentDataConsentDialogInViewController:(UIViewController*)viewController;
/**
 * Defaults to forbidden;
 * Thread-safe.
 */

/**
 * Set network consent info individually; according to the network specifications, types for the info you should provide for the networks should be as follows:
 * Mobvista: dictionary, in which you can either set @YES/@NO for key @0 to allow/prevent all three types of data collection(example, @{@0:@YES}), or you can set @YES/@NO each for @1, @2, @3 keys respectively(example, @{@1:@YES, @2:@NO, @3:@YES});for more detailed infomation, please refer to its official website.
 * Inmobi: BOOL wrapped as an NSNumber
 * Mopub: BOOL wrapped as an NSNumber
 * Admob: A dictionary containing the follow keys and values:
 *       1) An NSInteger wrapped as an NSNumber specifying the consent status(0=unknown, 1=non personalized or 2=personalized), under the key kAdmobConsentStatusKey
 *       2) A BOOL wrapped as an NSNumber indicating whether you as a developer are aware that the user is under the age of conscent, under the key kAdmobUnderAgeKey
 * Applovin: A dictionary containing the follow keys and values:
 *       1) An BOOL wrapped as an NSNumber indicating if user has provided consent for information sharing with AppLovin, under the key
 *       2) An BOOL wrapped as an NSNumber indicating if the user is age restricted
 * Example: {
            kNetworkNameMobvista:@{@1:@YES, @2:@YES, @3:@NO},
            kNetworkNameInmobi:@YES,
            kNetworkNameMopub:@NO,
            kNetworkNameAdmob:@{kAdmobConsentStatusKey:@1, kAdmobUnderAgeKey:@NO},
            kNetworkNameApplovin:@{kApplovinConscentStatusKey:@YES, kApplovinUnderAgeKey:@NO}
 *          }
 */
@property(nonatomic) NSDictionary *networkConsentInfo;
@property(nonatomic, readonly) UpArpuDataConsentSet dataConsentSet;
@property(nonatomic, readonly) NSString *appID;
@property(nonatomic, readonly) NSString *appKey;

-(NSString*)version;
@end
