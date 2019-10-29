//
//  ViewController.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "ViewController.h"
#import "UPADShowViewController.h"
#import "UPArpuRewardedVideoVideoViewController.h"
#import "UPADShowViewController.h"
#import "UPArpuRewardedVideoVideoViewController.h"
#import "UPArpuBannerViewController.h"
#import "UPArpuInterstitialViewController.h"
#import "UPArpuNativeBannerViewController.h"
@import UpArpuSDK;
@import UpArpuRewardedVideo;
@import UpArpuSplash;
@import UpArpuNative;
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UPArpuSplashDelegate, UPArpuNativeBannerDelegate, UPArpuNativeSplashDelegate>
    @property(nonatomic, readonly) UITableView *tableView;
    @property(nonatomic, readonly) NSArray<NSArray<NSString*>*>* placementNames;
    @end

static NSString *const kCellIdentifier = @"cell";
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _placementNames = @[@[kSigmobPlacement,kGDTPlacement, kBaiduPlacement, kTTPlacementName, kAllPlacementName],
                        @[kSigmobPlacement,kMyOfferPlacement, kKSPlacement,kHeaderBiddingPlacement, kNendPlacement, kNendInterstitialVideoPlacement, kNendFullScreenInterstitialPlacement, kMaioPlacement, kUnityAdsPlacementName, kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMintegralVideoPlacement, kMopubPlacementName, kGDTPlacement, kChartboostPlacementName, kTapjoyPlacementName, kIronsourcePlacementName, kVunglePlacementName, kAdcolonyPlacementName, kTTPlacementName, kTTVideoPlacement, kOnewayPlacementName, kYeahmobiPlacement, kAppnextPlacement, kBaiduPlacement, kAllPlacementName],
                        @[kNendPlacement, kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kGDTPlacement, kMopubPlacementName, kTTPlacementName, kYeahmobiPlacement, kAppnextPlacement, kBaiduPlacement, kAllPlacementName],
                        @[kSigmobPlacement,kMyOfferPlacement, kKSPlacement,kHeaderBiddingPlacement, kNendPlacement, kMaioPlacement, kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMopubPlacementName, kGDTPlacement, kChartboostPlacementName, kTapjoyPlacementName, kIronsourcePlacementName, kVunglePlacementName, kAdcolonyPlacementName, kUnityAdsPlacementName, kTTPlacementName, kOnewayPlacementName, kYeahmobiPlacement, kAppnextPlacement, kBaiduPlacement, kAllPlacementName],
                        @[kHeaderBiddingPlacement, kNendPlacement, kNendVideoPlacement, kTTFeedPlacementName, kTTDrawPlacementName, kMPPlacement, kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMopubPlacementName, kGDTPlacement, kGDTTemplatePlacement, kYeahmobiPlacement, kAppnextPlacement, kBaiduPlacement, kAllPlacementName],
                        @[kNendPlacement, kTTFeedPlacementName, kTTDrawPlacementName, kMPPlacement, kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMopubPlacementName, kGDTPlacement, kGDTTemplatePlacement, kYeahmobiPlacement, kAppnextPlacement, kAllPlacementName],
                        @[kTTFeedPlacementName, kMPPlacement, kFacebookPlacement, kAdMobPlacement, kApplovinPlacement, kMintegralPlacement, kGDTPlacement, kYeahmobiPlacement, kAppnextPlacement, kAllPlacementName]];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"GDPR" style:UIBarButtonItemStylePlain target:self action:@selector(policyButtonTapped)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)policyButtonTapped {
    [[UPArpuAPI sharedInstance] presentDataConsentDialogInViewController:self];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [_placementNames count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_placementNames[section] count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25.0f;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @[@"Splash", @"Interstitial", @"Banner", @"RV", @"Native", @"Native Banner", @"Native Splash"][section];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = _placementNames[[indexPath section]][[indexPath row]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([indexPath section] == 3) {
        UPArpuRewardedVideoVideoViewController *tVC = [[UPArpuRewardedVideoVideoViewController alloc] initWithPlacementName:_placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 6) {
        [UPArpuNativeSplashWrapper loadNativeSplashAdWithPlacementID:[UPADShowViewController nativePlacementIDs][_placementNames[[indexPath section]][[indexPath row]]] extra:@{kExtraInfoNativeAdTypeKey:@(UPArpuGDTNativeAdTypeSelfRendering), kExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(CGRectGetWidth(self.view.bounds) - 30.0f, 400.0f)], kUPArpuExtraNativeImageSizeKey:kUPArpuExtraNativeImageSize690_388, kUPArpuNativeSplashShowingExtraCountdownIntervalKey:@3} customData:nil delegate:self];
    } else if ([indexPath section] == 5) {
        UPArpuNativeBannerViewController *tVC = [[UPArpuNativeBannerViewController alloc] initWithPlacementName: _placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 4) {
        UPADShowViewController *tVC = [[UPADShowViewController alloc] initWithPlacementName: _placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 2) {
        UPArpuBannerViewController *tVC = [[UPArpuBannerViewController alloc] initWithPlacementName:_placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 1) {
        UPArpuInterstitialViewController *tVC = [[UPArpuInterstitialViewController alloc] initWithPlacementName:_placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(.0f, .0f, CGRectGetWidth([UIScreen mainScreen].bounds), 100.0f)];
        label.text = @"Splash Container View";
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
       [[UPArpuAdManager sharedManager] loadADWithPlacementID:@[@"b5d771f34bc73d", @"b5c1b0470c7e4a", @"b5c1b047a970fe", @"b5c1b048c498b9", @"b5c22f0e5cc7a0"][[indexPath row]] extra:@{kUPArpuSplashExtraTolerateTimeoutKey:@3.0f} customData:nil delegate:self window:[UIApplication sharedApplication].keyWindow containerView:label];
    }
}

#pragma mark - native splash delegate(s)
-(void) finishLoadingNativeSplashAdForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::finishLoadingNativeSplashAdForPlacementID:%@", placementID);
    CGFloat width = UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? CGRectGetWidth([UIScreen mainScreen].bounds) : 100.0f;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? .0f : CGRectGetWidth(self.view.bounds) - width, .0f, width, UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? 79.0f : CGRectGetHeight([UIScreen mainScreen].bounds))];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Joypac";
    [UPArpuNativeSplashWrapper showNativeSplashAdWithPlacementID:placementID extra:@{kUPArpuNatievSplashShowingExtraStyleKey:UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? kUPArpuNativeSplashShowingExtraStylePortrait : kUPArpuNativeSplashShowingExtraStyleLandscape, kUPArpuNativeSplashShowingExtraCountdownIntervalKey:@3, kUPArpuNativeSplashShowingExtraContainerViewKey:label} delegate:self];
}

-(void) failedToLoadNativeSplashAdForPlacementID:(NSString*)placementID error:(NSError*)error {
    NSLog(@"ViewController::failedToLoadNativeSplashAdForPlacementID:%@ error:%@", placementID, error);
}

-(void) didShowNativeSplashAdForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::didShowNativeSplashAdForPlacementID:%@", placementID);
}

-(void) didClickNaitveSplashAdForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::didClickNaitveSplashAdForPlacementID:%@", placementID);
}

-(void) didCloseNativeSplashAdForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::didCloseNativeSplashAdForPlacementID:%@", placementID);
}
#pragma mark - UPArpu Splash Delegate method(s)
-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"ViewController::didFinishLoadingADWithPlacementID:%@", placementID);
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    NSLog(@"ViewController::didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
}

-(void)splashDidShowForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::splashDidShowForPlacementID:%@", placementID);
}

-(void)splashDidClickForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::splashDidClickForPlacementID:%@", placementID);
}

-(void)splashDidCloseForPlacementID:(NSString*)placementID {
    NSLog(@"ViewController::splashDidCloseForPlacementID:%@", placementID);
}

#pragma mark - splash delegate with networkID and adsourceID
-(void)didShowNativeSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ViewController::splashDidShowForPlacementID:%@ with extra: %@", placementID,extra);
}

-(void)didClickNaitveSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ViewController::splashDidClickForPlacementID:%@ with extra: %@", placementID,extra);
}

-(void)didCloseNativeSplashAdForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ViewController::splashDidCloseForPlacementID:%@ with extra: %@", placementID,extra);
}
-(void)splashDidShowForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra {
    NSLog(@"AppDelegate::splashDidShowForPlacementID:%@ with extra: %@", placementID,extra);
    
}

-(void)splashDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"AppDelegate::splashDidClickForPlacementID:%@ with extra: %@", placementID,extra);
    
}

-(void)splashDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"AppDelegate::splashDidCloseForPlacementID:%@ with extra: %@", placementID,extra);
}
@end
