//
//  UPArpuBannerViewController.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 19/09/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "UPArpuBannerViewController.h"
@import UpArpuSDK;
@import UpArpuBanner;

static NSString *const kGDTPlacementID = @"b5bacad0803fd1";
static NSString *const kTTPlacementID = @"b5bacacfc470c9";
static NSString *const kAdmobPlacementID = @"b5bacacef17717";
static NSString *const kApplovinPlacementID = @"b5bacace1549da";
static NSString *const kFacebookPlacementID = @"b5baf502bb23e3";
static NSString *const kMopubPlacementID = @"b5baf57068e0b6";
static NSString *const kFlurryPlacementID = @"b5baf52fe4e57b";
static NSString *const kInmobiPlacementID = @"b5baf522891992";
static NSString *const kAllPlacementID = @"b5bacaccb61c29";
static NSString *const kYeahmobiPlacementID = @"b5bc7fb61b3213";
static NSString *const kAppnextPlacementID = @"b5bc7fb78288e9";
static NSString *const kBaiduPlacementID = @"b5c04dda229f7e";

NSString *const kBannerShownNotification = @"banner_shown";
NSString *const kBannerLoadingFailedNotification = @"banner_failed_to_load";
@interface UPArpuBannerViewController ()<UPArpuBannerDelegate>
@property(nonatomic, readonly) NSString *name;
@property(nonatomic, readonly) NSDictionary<NSString*, NSString*>* placementIDs;
@property(nonatomic, readonly) UIActivityIndicatorView *loadingView;
@property(nonatomic, readonly) UIButton *reloadADButton;
@property(nonatomic, readonly) UIButton *clearAdButton;
@property(nonatomic, readonly) UIButton *showAdButton;
@property(nonatomic, readonly) UILabel *failureTipsLabel;
@property(nonatomic, readonly) UIButton *removeAdButton;
@end

@implementation UPArpuBannerViewController
-(instancetype) initWithPlacementName:(NSString*)name {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        _name = name;
        _placementIDs = @{
                          kGDTPlacement:kGDTPlacementID,
                          kTTPlacementName:kTTPlacementID,
                          kAdMobPlacement:kAdmobPlacementID,
                          kApplovinPlacement:kApplovinPlacementID,
                          kFacebookPlacement:kFacebookPlacementID,
                          kMopubPlacementName:kMopubPlacementID,
                          kFlurryPlacement:kFlurryPlacementID,
                          kInmobiPlacement:kInmobiPlacementID,
                          kAllPlacementName:kAllPlacementID,
                          kYeahmobiPlacement:kYeahmobiPlacementID,
                          kAppnextPlacement:kAppnextPlacementID,
                          kBaiduPlacement:kBaiduPlacementID
                          };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _name;
    _reloadADButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reloadADButton addTarget:self action:@selector(reloadADButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_reloadADButton setTitleColor:_reloadADButton.tintColor forState:UIControlStateNormal];
    [_reloadADButton setTitle:@"Reload AD" forState:UIControlStateNormal];
    _reloadADButton.frame = CGRectMake(.0f, CGRectGetMaxY(self.view.bounds) - 100.0f, (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_reloadADButton];
    
    _showAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_showAdButton addTarget:self action:@selector(showBanner) forControlEvents:UIControlEventTouchUpInside];
    [_showAdButton setTitleColor:_showAdButton.tintColor forState:UIControlStateNormal];
    [_showAdButton setTitle:@"Show AD" forState:UIControlStateNormal];
    _showAdButton.frame = CGRectMake(CGRectGetMaxX(_reloadADButton.frame) + 40.0f, CGRectGetMinY(_reloadADButton.frame), (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_showAdButton];
    
    _clearAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clearAdButton addTarget:self action:@selector(clearAdButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_clearAdButton setTitleColor:_clearAdButton.tintColor forState:UIControlStateNormal];
    [_clearAdButton setTitle:@"clear cache" forState:UIControlStateNormal];
    _clearAdButton.frame = CGRectMake(.0f, CGRectGetMinY(_reloadADButton.frame) - 20.0f - 60.0f, (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_clearAdButton];
    
    _removeAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_removeAdButton addTarget:self action:@selector(removeAdButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_removeAdButton setTitleColor:_removeAdButton.tintColor forState:UIControlStateNormal];
    [_removeAdButton setTitle:@"Remove Ad" forState:UIControlStateNormal];
    _removeAdButton.frame = CGRectMake(CGRectGetMaxX(_clearAdButton.frame) + 40.0f, CGRectGetMinY(_clearAdButton.frame), (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_removeAdButton];
    
    _failureTipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(.0f, 64.0f, CGRectGetWidth(self.view.bounds), 400.0f)];
    _failureTipsLabel.text = @"Failed to load ad";
    _failureTipsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_failureTipsLabel];
    _failureTipsLabel.hidden = YES;
    
    if ([[UPArpuAdManager sharedManager] bannerAdReadyForPlacementID:_placementIDs[_name]]) {
        NSLog(@"UPArpuBannerViewController::banner ad ready, will show");
        [self showBanner];
    } else {
        NSLog(@"UPArpuBannerViewController::banner ad not ready, will load");
        [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] extra:nil customData:nil delegate:self];
    }
}

-(void) reloadADButtonTapped {
    _failureTipsLabel.hidden = YES;
    [self.view addSubview:_loadingView];
    [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] extra:nil customData:nil delegate:self];
}

-(void) removeAdButtonTapped {
    [[self.view viewWithTag:3333] removeFromSuperview];
}

-(void) clearAdButtonTapped {
    [[UPArpuAdManager sharedManager] clearCache];
}

-(void) dealloc {
    NSLog(@"dealloc");
}

-(void) showBanner {
    if ([[UPArpuAdManager sharedManager] bannerAdReadyForPlacementID:_placementIDs[_name]]) {
        NSInteger tag = 3333;
        [[self.view viewWithTag:tag] removeFromSuperview];
        UPArpuBannerView *bannerView = [[UPArpuAdManager sharedManager] retrieveBannerViewForPlacementID:_placementIDs[_name]];
        bannerView.delegate = self;
        bannerView.translatesAutoresizingMaskIntoConstraints = NO;
        bannerView.tag = tag;
        [self.view addSubview:bannerView];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:bannerView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bannerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:64.0f]];
    } else {
        NSLog(@"Banner ad's not ready for placementID:%@", _placementIDs[_name]);
    }
}

#pragma mark - delegate method(s)
-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"UPArpuBannerViewController::didFinishLoadingADWithPlacementID:%@", placementID);
    [_loadingView removeFromSuperview];
    [self showBanner];
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    NSLog(@"UPArpuBannerViewController::didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
    _failureTipsLabel.hidden = NO;
}

-(void) bannerView:(UPArpuBannerView *)bannerView didShowAdWithPlacementID:(NSString *)placementID {
    NSLog(@"UPArpuBannerViewController::bannerView:didShowAdWithPlacementID:%@", placementID);
}

-(void) bannerView:(UPArpuBannerView*)bannerView didClickWithPlacementID:(NSString*)placementID {
    NSLog(@"UPArpuBannerViewController::bannerView:didClickWithPlacementID:%@", placementID);
}

-(void) bannerView:(UPArpuBannerView*)bannerView didCloseWithPlacementID:(NSString*)placementID {
    NSLog(@"UPArpuBannerViewController::bannerView:didCloseWithPlacementID:%@", placementID);
}
@end
