//
//  AppDelegate.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"
@import UpArpuSDK;
@import InMobiSDK;
//@import FBAudienceNetwork;
@import GoogleMobileAds;
@import UpArpuSplash;
@interface AppDelegate ()<UPArpuSplashDelegate>
    
    @end

@implementation AppDelegate
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"application didFinishLaunchingWithOptions");
    [UPArpuAPI setLogEnabled:YES];
    [[UPArpuAPI sharedInstance] setDataConsentSet:UpArpuDataConsentSetPersonalized consentString:nil];
    [UPArpuAPI sharedInstance].networkConsentInfo = @{
                                                      kNetworkNameMintegral:@{@1:@YES, @2:@YES, @3:@YES},
                                                      kNetworkNameInmobi:@{kInmobiGDPRStringKey:@"0", kInmobiConsentStringKey:@"true"},
                                                      kNetworkNameMopub:@NO,
                                                      kNetworkNameAdmob:@{kAdmobConsentStatusKey:@1, kAdmobUnderAgeKey:@NO},
                                                      kNetworkNameApplovin:@{kApplovinConscentStatusKey:@YES, kApplovinUnderAgeKey:@NO},
                                                      kNetworkNameTapjoy:@{kTapjoyConsentValueKey:@"0", kTapjoyGDPRSubjectionKey:@NO},
                                                      kNetworkNameChartboost:@NO,
                                                      kNetworkNameVungle:@1,
                                                      kNetworkNameIronSource:@YES
                                                      };

    [UPArpuAPI sharedInstance].channel = @"test_channel_demo";
    [UPArpuAPI sharedInstance].subchannel = @"test_subchannel";

    [UPArpuAPI sharedInstance].customData = @{@"demo_custom_data_key":@"demo_custom_data_val"};
    [[UPArpuAPI sharedInstance] startWithAppID:@"a5b0e8491845b3" appKey:@"7eae0567827cfe2b22874061763f30c9" error:nil];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(.0f, .0f, CGRectGetWidth([UIScreen mainScreen].bounds), 100.0f)];
    label.text = @"Splash Container View";
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
//    [self.window makeKeyAndVisible];
//    [[UPArpuAdManager sharedManager] loadADWithPlacementID:@"b5c248a48049cb" extra:nil customData:nil delegate:self window:[UIApplication sharedApplication].keyWindow containerView:label];
//    NSLog(@"application UPArpuAPI startWithAppID end");
    return YES;
}
    
    
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"application applicationWillResignActive");
}
    
    
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"application applicationDidEnterBackground");
}
    
    
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"application applicationWillEnterForeground");
}
    
    
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
    
    
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UPArpu Splash Delegate method(s)
-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"AppDelegate::didFinishLoadingADWithPlacementID:%@", placementID);
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    NSLog(@"AppDelegate::didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
}

-(void)splashDidShowForPlacementID:(NSString*)placementID {
    NSLog(@"AppDelegate::splashDidShowForPlacementID:%@", placementID);
}

-(void)splashDidClickForPlacementID:(NSString*)placementID {
    NSLog(@"AppDelegate::splashDidClickForPlacementID:%@", placementID);
}

-(void)splashDidCloseForPlacementID:(NSString*)placementID {
    NSLog(@"AppDelegate::splashDidCloseForPlacementID:%@", placementID);
}

@end

