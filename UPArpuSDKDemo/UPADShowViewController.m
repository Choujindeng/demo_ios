//
//  UPADShowViewController.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "UPADShowViewController.h"
#import "MTAutolayoutCategories.h"
@import UpArpuSDK;

NSString *const kPlacement0Name = @"Mobvista Placement 0";
NSString *const kInmobiPlacement = @"Inmobi Placement 1";
NSString *const kFacebookPlacement = @"Facebook Placement";
NSString *const kAdMobPlacement = @"AdMob Placement";
NSString *const kApplovinPlacement = @"Applovin Placement";
NSString *const kFlurryPlacement = @"Flurry Placement";
NSString *const kPlacement1Name = @"Uparpu_Demo_IOS_MV";
NSString *const kPlacement2Name = @"串行network";
NSString *const kPlacement3Name = @"并行network";

static NSString *const kPlacement0ID = @"b5ad9ba61dcb39";
static NSString *const kInmobiPlacementID = @"b5adae16a6c501";
static NSString *const kMobvistaPlacementID = @"b5acc73d9b7200";
static NSString *const kFacebookPlacementID = @"b5ae0372ab4d34";
static NSString *const kAdMobPlacementID = @"b5ae18a81a2905";
static NSString *const kApplovinPlacementID = @"b5aa1fa7956158";
static NSString *const kFlurryPlacementID = @"b5ae2e0e62c71b";
static NSString *const kSerialPlacementID = @"b5ad5a72a751cb";
static NSString *const kConcurrentPlacementID = @"b5ad5a9bcac282";

@interface DMADView:UPNativeADView
@property(nonatomic, readonly, getter=titleLabel) UILabel *titleLabel_impl;
@property(nonatomic, readonly, getter=textLabel) UILabel *textLabel_impl;
@property(nonatomic, readonly, getter=ctaLabel) UILabel *ctaLabel_impl;
@property(nonatomic, readonly, getter=ratingLabel) UILabel *ratingLabel_impl;
@property(nonatomic, readonly, getter=iconImageView) UIImageView *iconImageView_impl;
@property(nonatomic, readonly, getter=mainImageView) UIImageView *mainImageView_impl;
@property(nonatomic, readonly) UIButton *ctaButton;
@end

@implementation DMADView
-(void) initSubviews {
    [super initSubviews];
    _titleLabel_impl = [UILabel autolayoutLabelFont:[UIFont boldSystemFontOfSize:18.0f] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    [self addSubview:_titleLabel_impl];
    
    _textLabel_impl = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_textLabel_impl];
    
    _ctaLabel_impl = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_ctaLabel_impl];
    
    _ctaButton = [UIButton autolayoutButtonWithType:UIButtonTypeCustom];
    [self insertSubview:_ctaButton aboveSubview:_ctaLabel_impl];
    
    _ratingLabel_impl = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_ratingLabel_impl];
    
    _iconImageView_impl = [UIImageView autolayoutView];
    _iconImageView_impl.layer.cornerRadius = 4.0f;
    _iconImageView_impl.layer.masksToBounds = YES;
    _iconImageView_impl.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_iconImageView_impl];
    
    _mainImageView_impl = [UIImageView autolayoutView];
    _mainImageView_impl.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_mainImageView_impl];
    
    self.mediaView.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void) layoutSubviews {
    [super layoutSubviews];
}

-(void) makeConstraintsForSubviews {
    [super makeConstraintsForSubviews];
    NSDictionary *viewsDict = nil;
    if (self.mediaView != nil) {
        viewsDict = @{@"titleLabel":self.titleLabel, @"textLabel":self.textLabel, @"ctaLabel":self.ctaLabel, @"ratingLabel":self.ratingLabel, @"iconImageView":self.iconImageView, @"mainImageView":self.mainImageView, @"mediaView":self.mediaView};
    } else {
        viewsDict = @{@"titleLabel":self.titleLabel, @"textLabel":self.textLabel, @"ctaLabel":self.ctaLabel, @"ratingLabel":self.ratingLabel, @"iconImageView":self.iconImageView, @"mainImageView":self.mainImageView};
    }
    [self addConstraintsWithVisualFormat:@"|[mainImageView]|" options:0 metrics:nil views:viewsDict];
    [self addConstraintsWithVisualFormat:@"V:[iconImageView][mainImageView]|" options:0 metrics:nil views:viewsDict];
    
    [self addConstraintWithItem:self.iconImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:.0f];
    [self addConstraintsWithVisualFormat:@"|-15-[iconImageView(90)]-8-[titleLabel]-15-|" options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict];
    [self addConstraintsWithVisualFormat:@"V:|-15-[titleLabel]-8-[textLabel]-8-[ctaLabel]-8-[ratingLabel]" options:NSLayoutFormatAlignAllLeading | NSLayoutFormatAlignAllTrailing metrics:nil views:viewsDict];
    
    if (self.mediaView != nil) {
        [self addConstraintsWithVisualFormat:@"|[mediaView]|" options:0 metrics:nil views:viewsDict];
        [self addConstraintsWithVisualFormat:@"V:[iconImageView][mediaView]|" options:0 metrics:nil views:viewsDict];
    }
}
@end

@interface UPADShowViewController()<UPArpuNativeADDelegate>
@property(nonatomic, readonly) NSDictionary *placementIDs;
@property(nonatomic, readonly) NSString *name;
@property(nonatomic, readonly) UIActivityIndicatorView *loadingView;
@property(nonatomic, readonly) UIButton *reloadADButton;
@end
@implementation UPADShowViewController
-(instancetype) initWithPlacementName:(NSString*)name {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        _name = name;
        _placementIDs = @{kPlacement0Name:kPlacement0ID,
                          kPlacement1Name:kMobvistaPlacementID,
                          kPlacement2Name:kSerialPlacementID,
                          kPlacement3Name:kConcurrentPlacementID,
                          kInmobiPlacement:kInmobiPlacementID,
                          kFacebookPlacement:kFacebookPlacementID,
                          kAdMobPlacement:kAdMobPlacementID,
                          kApplovinPlacement:kApplovinPlacementID,
                          kFlurryPlacement:kFlurryPlacementID
                          };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _name;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _reloadADButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reloadADButton addTarget:self action:@selector(reloadADButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_reloadADButton setTitleColor:_reloadADButton.tintColor forState:UIControlStateNormal];
    [_reloadADButton setTitle:@"ReloadAD" forState:UIControlStateNormal];
    _reloadADButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 100.0f, CGRectGetMaxY(self.view.bounds) - 100.0f, 200.0f, 80.0f);
    [self.view addSubview:_reloadADButton];
    
    
    if ([[UPArpuAdManager sharedManager] ADReadyForPlacementID:_placementIDs[_name]]) {
        [self showAD];
    } else {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _loadingView.center = CGPointMake(CGRectGetMidX(self.view.bounds), 100.0f);
        [_loadingView startAnimating];
        [self.view addSubview:_loadingView];
        [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] delegate:self];
    }
}

-(void) dealloc {
    NSLog(@"dealloc");
}

static NSInteger adViewTag = 3333;
-(void) reloadADButtonTapped {
    [[self.view viewWithTag:adViewTag] removeFromSuperview];
    [self.view addSubview:_loadingView];
    [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] delegate:self];
}

-(void) showAD {
    UPNativeADConfiguration *config = [[UPNativeADConfiguration alloc] init];
    config.ADFrame = CGRectMake(.0f, 64.0f, CGRectGetWidth(self.view.bounds), 400.0f);
    config.delegate = self;
    config.renderingViewClass = [DMADView class];
    DMADView *adView = (DMADView*)[[UPArpuAdManager sharedManager] retriveAdViewWithPlacementID:_placementIDs[_name] configuration:config];
    adView.tag = adViewTag;
    [self.view addSubview:adView];
}

#pragma mark - ad loading delegate
-(void) didClickNativeAdInAdView:(UPNativeADView*)adView placementID:(NSString*)placementID {
    
}

-(void) didShowNativeAdInAdView:(UPNativeADView*)adView placementID:(NSString*)placementID {
    adView.mainImageView.hidden = [adView isVideoContents];
}

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    [_loadingView removeFromSuperview];
    [self showAD];
}

-(void) didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    NSLog(@"did failed to load ad, error: %@", error);
}

-(void) exceptionDidOccurWithPlacementID:(NSString*)placementID {
}
@end
