//
//  UPArpuNativeSplashWrapper.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 2019/3/19.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import "UPArpuNativeSplashWrapper.h"
#import <UpArpuNative/UpArpuNative.h>
#import "UIViewController+PresentationAndDismissalSwizzling.h"
#import <objc/runtime.h>

NSString *const kUPArpuNativeSplashShowingExtraCTAButtonBackgroundColorKey = @"cta_button";
NSString *const kUPArpuNativeSplashShowingExtraContainerViewKey = @"container_view";
NSString *const kUPArpuNativeSplashShowingExtraCountdownIntervalKey = @"countdown_interval";
NSString *const kUPArpuNatievSplashShowingExtraStyleKey = @"layout_style";

NSString *const kUPArpuNativeSplashShowingExtraStylePortrait = @"layout_style_protrait";
NSString *const kUPArpuNativeSplashShowingExtraStyleLandscape = @"layout_style_landscape";

@interface UPArpuNativeSplashWrapper(Layout)
@end
@implementation UPArpuNativeSplashWrapper (Layout)

+(BOOL) layoutStylePortrait {
    return [kUPArpuNativeSplashShowingExtraStylePortrait isEqualToString:[[UPArpuNativeSplashWrapper sharedWrapper] valueForKey:@"layoutStyle"]];
}

@end

#pragma mark - UIView autolayout utilities
@interface UIView(Autolayout)
+(instancetype) internal_autolayoutView;
- (NSArray<__kindof NSLayoutConstraint *> *)internal_addConstraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary<NSString *,id> *)metrics views:(NSDictionary<NSString *, id> *)views;
-(NSLayoutConstraint*)internal_addConstraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
@end

@interface UILabel(Autolayout)
+(instancetype) internal_autolayoutLabelFont:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment;
/**
 * textAlignment defaults to NSTextAlignmentLeft
 */
+(instancetype) internal_autolayoutLabelFont:(UIFont*)font textColor:(UIColor*)textColor;
@end

@interface UIButton(Autolayout)
+(instancetype) internal_autolayoutButtonWithType:(UIButtonType)type;
@end

#pragma mark - UIScreen category
@interface UIScreen(SafeArea)
@end
@implementation UIScreen (SafeArea)

+(UIEdgeInsets)safeAreaInsets {
    return ([[UIApplication sharedApplication].keyWindow respondsToSelector:@selector(safeAreaInsets)] ? [UIApplication sharedApplication].keyWindow.safeAreaInsets : UIEdgeInsetsZero);
}

@end

#pragma mark - rating view
@interface UPArpuSplashNativeStarRatingView:UIView
@property(nonatomic, readonly) UIImageView *star0;
@property(nonatomic, readonly) UIImageView *star1;
@property(nonatomic, readonly) UIImageView *star2;
@property(nonatomic, readonly) UIImageView *star3;
@property(nonatomic, readonly) UIImageView *star4;
@end
@implementation UPArpuSplashNativeStarRatingView
-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self initSubviews];
        [self makeConstraintsForSubviews];
    }
    return self;
}

-(void) initSubviews {
    _star0 = [UIImageView internal_autolayoutView];
    [self addSubview:_star0];
    
    _star1 = [UIImageView internal_autolayoutView];
    [self addSubview:_star1];
    
    _star2 = [UIImageView internal_autolayoutView];
    [self addSubview:_star2];
    
    _star3 = [UIImageView internal_autolayoutView];
    [self addSubview:_star3];
    
    _star4 = [UIImageView internal_autolayoutView];
    [self addSubview:_star4];
}

-(void) makeConstraintsForSubviews {
    [self internal_addConstraintsWithVisualFormat:@"|[_star0(18)]-10-[_star1(18)]-10-[_star2(18)]-10-[_star3(18)]-10-[_star4(18)]" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:0 views:NSDictionaryOfVariableBindings(_star0, _star1, _star2, _star3, _star4)];
    [self internal_addConstraintsWithVisualFormat:@"V:|[_star0(18)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_star0, _star1, _star2, _star3, _star4)];
}

-(CGSize)intrinsicContentSize {
    return CGSizeMake(18.0f * 5.0f + 10.0f * 4.0f, 18.0f);
}

+(void) configureStarView:(UPArpuSplashNativeStarRatingView*)starView star:(CGFloat)star {
    NSArray<UIImageView*>* stars = @[starView.star0, starView.star1, starView.star2, starView.star3, starView.star4];
    NSInteger consumedStar = 0;
    CGFloat remainStar = star;
    while (consumedStar < 5) {
        stars[consumedStar++].image = [UIImage imageNamed:remainStar >= 1.0f ? @"star_on" : remainStar > .0f ? @"semi_star" : @"star_off"];
        remainStar -= remainStar > 1.0f ? 1.0f : remainStar > .0f ? remainStar : .0f;
    }
}
@end

#pragma mark - splash view
@interface UPArpuNativeSplashView:UPArpuNativeADView
@property(nonatomic, readonly) UIVisualEffectView *blurView;
@property(nonatomic, readonly) UIButton *skipButton;

@property(nonatomic, readonly) UPArpuSplashNativeStarRatingView *starView;
@property(nonatomic, readonly) UILabel *advertiserLabel;
@property(nonatomic, readonly) UILabel *textLabel;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UILabel *ctaLabel;
@property(nonatomic, readonly) UILabel *ratingLabel;
@property(nonatomic, readonly) UIImageView *iconImageView;
@property(nonatomic, readonly) UIImageView *mainImageView;
@property(nonatomic, readonly) UIImageView *sponsorImageView;
@property(nonatomic, readonly) UIImageView *backgroundImageView;
@property(nonatomic, readonly) UIImageView *ctaBackgroundImageView;

@property(nonatomic, readonly) UILabel *adNoteLabel;
@end

static NSString *const kSkipTextFormatString = @"%lds 跳过";
@implementation UPArpuNativeSplashView
-(void) initSubviews {
    [super initSubviews];
    _backgroundImageView = [UIImageView internal_autolayoutView];
    [self addSubview:_backgroundImageView];
    
    self.backgroundColor = [UIColor clearColor];
    _blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _blurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_blurView];
    
    _advertiserLabel = [UILabel internal_autolayoutLabelFont:[UIFont systemFontOfSize:11.0f] textColor:[UIColor whiteColor]];
    [self addSubview:_advertiserLabel];
    _advertiserLabel.hidden = YES;
    
    _iconImageView = [UIImageView internal_autolayoutView];
    _iconImageView.layer.cornerRadius = 8.0f;
    _iconImageView.layer.masksToBounds = YES;
    _iconImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:_iconImageView];
    _iconImageView.hidden = [UPArpuNativeSplashWrapper layoutStylePortrait];
    
    _titleLabel = [UILabel internal_autolayoutLabelFont:[UIFont boldSystemFontOfSize:[UPArpuNativeSplashWrapper layoutStylePortrait] ? 23.0f : 16.0f] textColor:[UIColor whiteColor]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _textLabel = [UILabel internal_autolayoutLabelFont:[UIFont boldSystemFontOfSize:17.0f] textColor:[UIColor whiteColor]];
    _textLabel.numberOfLines = 2;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_textLabel];
    _textLabel.hidden = ![UPArpuNativeSplashWrapper layoutStylePortrait];
    
    _starView = [UPArpuSplashNativeStarRatingView internal_autolayoutView];
    [self addSubview:_starView];
    
    _mainImageView = [UIImageView internal_autolayoutView];
    _mainImageView.backgroundColor = [UIColor clearColor];
    _mainImageView.layer.cornerRadius = 4.0f;
    _mainImageView.layer.masksToBounds = YES;
    _mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_mainImageView];
    
    _ctaBackgroundImageView = [UIImageView internal_autolayoutView];
    _ctaBackgroundImageView.image = [[UIImage imageNamed:@"cta_btn_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(.0f, 35.0f, .0f, 35.0f) resizingMode:UIImageResizingModeStretch];
    [self addSubview:_ctaBackgroundImageView];
    
    _ctaLabel = [UILabel internal_autolayoutLabelFont:[UIFont systemFontOfSize:[UPArpuNativeSplashWrapper layoutStylePortrait] ? 23.0f : 15.0f] textColor:[UIColor whiteColor]];
    _ctaLabel.text = @"了解理多";
    _ctaLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_ctaLabel];
    
    CGFloat left = [UIScreen safeAreaInsets].left;
    CGFloat top = [UIScreen safeAreaInsets].top <= 0 ? CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) : [UIScreen safeAreaInsets].top;
    CGFloat width = [UPArpuNativeSplashWrapper layoutStylePortrait] ? 40.0f : 58.0f;
    CGFloat height = [UPArpuNativeSplashWrapper layoutStylePortrait] ? 22.0f : 20.0f;
    CGFloat radius = 4.0f;
    
    _adNoteLabel = [[UILabel alloc] initWithFrame:[UPArpuNativeSplashWrapper layoutStylePortrait] ? CGRectMake(left + 10.0f, 10.0f + (top > 20.0f ? .0f : top), width, height): CGRectMake(left + 20.0f, 20.0f + top, width, height)];
    _adNoteLabel.textColor = [UIColor whiteColor];
    _adNoteLabel.textAlignment = NSTextAlignmentCenter;
    _adNoteLabel.font = [UIFont systemFontOfSize:14.0f];
    _adNoteLabel.backgroundColor = [UPArpuNativeSplashWrapper layoutStylePortrait] ? [[UIColor whiteColor] colorWithAlphaComponent:.3f] : [[UIColor grayColor] colorWithAlphaComponent:.6f];
    _adNoteLabel.layer.cornerRadius = radius;
    _adNoteLabel.layer.masksToBounds = YES;
    _adNoteLabel.text = @"AD";
    [self addSubview:_adNoteLabel];
    
    _skipButton = [UIButton internal_autolayoutButtonWithType:UIButtonTypeCustom];
    [_skipButton setTitle:@"3s 跳过" forState:UIControlStateNormal];
    [_skipButton setTitleColor:[UIColor colorWithRed:233.0f / 255.0f green:233.0f / 255.0f blue:233.0f / 255.0f alpha:1.0f] forState:UIControlStateNormal];
    _skipButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _skipButton.backgroundColor = [UPArpuNativeSplashWrapper layoutStylePortrait] ? [[UIColor whiteColor] colorWithAlphaComponent:.3f] : [[UIColor grayColor] colorWithAlphaComponent:.6f];
    _skipButton.layer.cornerRadius = 14.0f;
    [self addSubview:_skipButton];
}

-(NSArray<UIView*>*) clickableViews {
    NSMutableArray <UIView*>* clickableViews = [NSMutableArray<UIView*> array];
    if (self.mediaView != nil) { [clickableViews addObject:self.mediaView]; }
    if (self.ctaLabel != nil) { [clickableViews addObject:self.ctaLabel]; }
    if (self.mainImageView != nil) { [clickableViews addObject:self.mainImageView]; }
    return clickableViews;
}

-(void) makeConstraintsForSubviews {
    UIEdgeInsets safeAreaInsets = [UIScreen safeAreaInsets];
    CGFloat top = safeAreaInsets.top <= 0 ? CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) : safeAreaInsets.top;
    CGFloat bottom = safeAreaInsets.bottom;
    CGFloat left = safeAreaInsets.left;
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_blurView, _skipButton, _iconImageView, _starView, _titleLabel, _mainImageView, _textLabel, _ctaLabel, _ctaBackgroundImageView);
    
    [self internal_addConstraintsWithVisualFormat:@"|[_blurView]|" options:0 metrics:nil views:viewsDict];
    [self internal_addConstraintsWithVisualFormat:@"V:|-top-[_blurView]-bottom-|" options:0 metrics:@{@"top":@(-top), @"bottom":@(-bottom)} views:viewsDict];
    
    [self internal_addConstraintsWithVisualFormat:@"|[_backgroundImageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_backgroundImageView)];
    [self internal_addConstraintsWithVisualFormat:@"V:|-top-[_backgroundImageView]-bottom-|" options:0 metrics:@{@"top":@(-top), @"bottom":@(-bottom)} views:NSDictionaryOfVariableBindings(_backgroundImageView)];
    
    if ([UPArpuNativeSplashWrapper layoutStylePortrait]) {
        CGFloat containerHeight = [((UIView*)[[UPArpuNativeSplashWrapper sharedWrapper] valueForKey:@"containerView"]) respondsToSelector:@selector(frame)] ? CGRectGetHeight(((UIView*)[[UPArpuNativeSplashWrapper sharedWrapper] valueForKey:@"containerView"]).frame) : .0f;
        [self internal_addConstraintsWithVisualFormat:@"[_skipButton(70)]-10-|" options:0 metrics:nil views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"V:|-top-[_skipButton(28)]" options:0 metrics:@{@"top":@(10 + (top > 20.0f ? .0f : top))} views:viewsDict];
        
        [self internal_addConstraintsWithVisualFormat:@"|-33-[_titleLabel]-33-|" options:0 metrics:nil views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"|-10-[_mainImageView]-10-|" options:0 metrics:nil views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"|-20-[_textLabel]-20-|" options:0 metrics:nil views:viewsDict];
        
        [self internal_addConstraintsWithVisualFormat:@"V:|-58-[_titleLabel]-12-[_starView]-30-[_mainImageView]-25-[_textLabel(55)]-20-[_ctaLabel(50)]->=bottom-|" options:NSLayoutFormatAlignAllCenterX metrics:@{@"bottom":@(bottom + containerHeight + 50.0f)} views:viewsDict];
        [_iconImageView internal_addConstraintWithItem:_iconImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_iconImageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:.0f];
        [_ctaLabel internal_addConstraintsWithVisualFormat:@"[_ctaLabel(200)]" options:0 metrics:nil views:viewsDict];
        [_mainImageView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_ctaLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:.0f];
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_ctaLabel attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:.0f];
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:222.0f];
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:71.0f];
    } else {
        CGFloat trailing = [((UIView*)[[UPArpuNativeSplashWrapper sharedWrapper] valueForKey:@"containerView"]) respondsToSelector:@selector(frame)] ? CGRectGetWidth(((UIView*)[[UPArpuNativeSplashWrapper sharedWrapper] valueForKey:@"containerView"]).frame) : .0f;
        [self internal_addConstraintsWithVisualFormat:@"[_skipButton(70)]-trailing-|" options:0 metrics:@{@"trailing":@(20.0f + trailing)} views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"V:|-20-[_skipButton(28)]" options:0 metrics:nil views:viewsDict];
        
        [self internal_addConstraintsWithVisualFormat:@"|-leading-[_mainImageView]-trailing-|" options:0 metrics:@{@"leading":@(left > 0 ? left : 15.0f), @"trailing":@(trailing + 15.0f)} views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"V:|-top-[_mainImageView]-10-[_iconImageView(53)]-15-|" options:NSLayoutFormatAlignAllLeading metrics:@{@"top":@(top + 15.0f)} views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"[_iconImageView]-10-[_titleLabel]" options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict];
        [self internal_addConstraintWithItem:_iconImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_iconImageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:.0f];
        [self internal_addConstraintsWithVisualFormat:@"[_titleLabel]->=10-[_ctaBackgroundImageView]-trailing-|" options:0 metrics:@{@"trailing":@(trailing + 5.0f)} views:viewsDict];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [self internal_addConstraintsWithVisualFormat:@"V:[_titleLabel]-10-[_starView]" options:NSLayoutFormatAlignAllLeading metrics:nil views:viewsDict];
        [self internal_addConstraintWithItem:_iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_ctaBackgroundImageView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:.0f];
        
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_ctaLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:.0f];
        [self internal_addConstraintWithItem:_ctaBackgroundImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_ctaLabel attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:.0f];
        [self internal_addConstraintsWithVisualFormat:@"[_ctaBackgroundImageView(160)]" options:0 metrics:nil views:viewsDict];
        [self internal_addConstraintsWithVisualFormat:@"V:[_ctaBackgroundImageView(71)]" options:0 metrics:nil views:viewsDict];
    }
}
@end

#pragma mark - timer category
@interface NSTimer (WTSKit)
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval target:(id)target repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
@end

static NSString *const kTimerUserInfoBlockKey = @"com.uparpu.timer_block";
@interface NSObject(NSTimer)
-(void) timerHandler_uparpu:(NSTimer*)timer;
@end
@implementation NSTimer (UPArpuKit)
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval target:(id)target repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:target selector:@selector(timerHandler_uparpu:) userInfo:@{kTimerUserInfoBlockKey:[block copy]} repeats:repeats];
}
@end

@implementation NSObject(UPArpuKit)
-(void) timerHandler_uparpu:(NSTimer *)timer {
    void (^block)(NSTimer*) = timer.userInfo[kTimerUserInfoBlockKey];
    if (block != nil) {
        block(timer);
    }
}

@end

#pragma mark - splash wrapper
@interface UPArpuNativeSplashWrapper()<UPArpuNativeADDelegate>
@property(nonatomic, readonly) dispatch_queue_t delegates_accessing_queue;
@property(nonatomic, readonly) NSMutableDictionary<NSString*, id<UPArpuNativeSplashDelegate>> *delegates;
@property(nonatomic) UPArpuNativeSplashView *currentSplashView;
@property(nonatomic, weak) UIView *containerView;
@property(nonatomic) NSString *layoutStyle;
@property(nonatomic) BOOL landingPageBeingShown;
@end
@implementation UPArpuNativeSplashWrapper
+(instancetype) sharedWrapper {
    static UPArpuNativeSplashWrapper *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[UPArpuNativeSplashWrapper alloc] init];
    });
    return sharedManager;
}

-(instancetype) init {
    self = [super init];
    if (self != nil) {
        _delegates_accessing_queue = dispatch_queue_create("nativeSplashDelegatesAccessingQueue.com.uparpu", DISPATCH_QUEUE_CONCURRENT);
        _delegates = [NSMutableDictionary<NSString*, id<UPArpuNativeSplashDelegate>> dictionary];
        [UIViewController swizzleMethods];
        [[NSNotificationCenter defaultCenter] addObserverForName:kUPArpuUIViewControllerPresentationNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) { [UPArpuNativeSplashWrapper sharedWrapper].landingPageBeingShown = YES; }];
        [[NSNotificationCenter defaultCenter] addObserverForName:kUPArpuUIViewControllerDismissalNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [UPArpuNativeSplashWrapper sharedWrapper].landingPageBeingShown = NO;
            [[UPArpuNativeSplashWrapper sharedWrapper] skipButtonTapped];
        }];
    }
    return self;
}

-(void) startCountdown:(NSTimeInterval)interval {
    __block NSInteger remainingTime = interval;
    [NSTimer timerWithTimeInterval:1.0f target:self repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (_currentSplashView != nil) {
            [_currentSplashView.skipButton setTitle:[NSString stringWithFormat:kSkipTextFormatString, --remainingTime] forState:UIControlStateNormal];
            if (remainingTime == 0) {
                [timer invalidate];
                if (![UPArpuNativeSplashWrapper sharedWrapper].landingPageBeingShown) { [self skipButtonTapped]; }
            }
        } else {
            [timer invalidate];
        }
    }];
}

-(void) setCurrentSplashView:(UPArpuNativeSplashView *)currentSplashView {
    [_currentSplashView removeFromSuperview];
    _currentSplashView = currentSplashView;
}

-(void) setDelegate:(id<UPArpuNativeSplashDelegate>)delegate forPlacementID:(NSString*)placementID {
    if (delegate != nil && placementID != nil) { dispatch_barrier_async(_delegates_accessing_queue, ^{ _delegates[placementID] = delegate; }); }
}

-(void) removeDelegateForPlacementID:(NSString*)placementID {
    if (placementID != nil) { dispatch_barrier_async(_delegates_accessing_queue, ^{ [_delegates removeObjectForKey:placementID]; }); }
}

-(id<UPArpuNativeSplashDelegate>)delegateForPlacementID:(NSString*)placementID {
    id<UPArpuNativeSplashDelegate> __block delegate = nil;
    dispatch_sync(_delegates_accessing_queue, ^{ delegate = _delegates[placementID]; });
    return delegate;
}

+(void) loadNativeSplashAdWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra customData:(NSDictionary*)customData delegate:(id<UPArpuNativeSplashDelegate>)delegate {
    [[UPArpuNativeSplashWrapper sharedWrapper] setDelegate:delegate forPlacementID:placementID];
    [[UPArpuAdManager sharedManager] loadADWithPlacementID:placementID extra:extra customData:customData delegate:[UPArpuNativeSplashWrapper sharedWrapper]];
}

+(void) showNativeSplashAdWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra delegate:(id<UPArpuNativeSplashDelegate>)delegate {
    [UPArpuNativeSplashWrapper sharedWrapper].containerView = extra[kUPArpuNativeSplashShowingExtraContainerViewKey];
    [UPArpuNativeSplashWrapper sharedWrapper].layoutStyle = extra[kUPArpuNatievSplashShowingExtraStyleKey] != nil ? extra[kUPArpuNatievSplashShowingExtraStyleKey] : kUPArpuNativeSplashShowingExtraStylePortrait;
    
    if ([extra[kUPArpuNativeSplashShowingExtraCountdownIntervalKey] isKindOfClass:[NSNumber class]]) {
        objc_setAssociatedObject([UPArpuNativeSplashWrapper sharedWrapper], (__bridge_retained void*)kUPArpuNativeSplashShowingExtraCountdownIntervalKey, extra[kUPArpuNativeSplashShowingExtraCountdownIntervalKey], OBJC_ASSOCIATION_RETAIN);
    }
    UPArpuNativeADConfiguration *config = [[UPArpuNativeADConfiguration alloc] init];
    UIEdgeInsets safeAreaInsets = [UIScreen safeAreaInsets];
    CGFloat top = safeAreaInsets.top;
    CGFloat bottom = safeAreaInsets.bottom;
    config.ADFrame = CGRectMake(.0f, top, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - top - bottom);
    config.delegate = [UPArpuNativeSplashWrapper sharedWrapper];
    config.rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    config.renderingViewClass = [UPArpuNativeSplashView class];
    [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView = [[UPArpuAdManager sharedManager] retriveAdViewWithPlacementID:placementID configuration:config];
    if ([UPArpuNativeSplashWrapper sharedWrapper].currentSplashView != nil) {
        if ([extra[kUPArpuNativeSplashShowingExtraCountdownIntervalKey] isKindOfClass:[NSNumber class]]) {
            objc_setAssociatedObject([UPArpuNativeSplashWrapper sharedWrapper], (__bridge_retained void*)kUPArpuNativeSplashShowingExtraCountdownIntervalKey, extra[kUPArpuNativeSplashShowingExtraCountdownIntervalKey], OBJC_ASSOCIATION_RETAIN);
            [[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.skipButton setTitle:[NSString stringWithFormat:kSkipTextFormatString, [extra[kUPArpuNativeSplashShowingExtraCountdownIntervalKey] integerValue]] forState:UIControlStateNormal];
        }

        if ([extra[kUPArpuNativeSplashShowingExtraCTAButtonBackgroundColorKey] isKindOfClass:[UIColor class]]) {
            [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.ctaLabel.backgroundColor = extra[kUPArpuNativeSplashShowingExtraCTAButtonBackgroundColorKey];
        }
        
        [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.mediaView.frame = [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.mainImageView.frame;
        [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.mainImageView.hidden = NO;
        [[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.skipButton addTarget:[UPArpuNativeSplashWrapper sharedWrapper] action:@selector(skipButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView bringSubviewToFront:[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.skipButton];
        [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView];
        [UPArpuSplashNativeStarRatingView configureStarView:[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.starView star:[[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.ratingLabel.text floatValue] > .0f ? [[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.ratingLabel.text floatValue] : 5.0f];
        if ([[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.ctaLabel.text length] <= 0) {
            [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.ctaLabel.text = @"了解更多";
        }
        
        if ([extra[kUPArpuNativeSplashShowingExtraContainerViewKey] isKindOfClass:[UIView class]]) {
            UIView *view = extra[kUPArpuNativeSplashShowingExtraContainerViewKey];
            view.frame = [UPArpuNativeSplashWrapper layoutStylePortrait] ? CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f - CGRectGetMidX(view.bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetHeight(view.bounds) - bottom, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds)) : CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - CGRectGetWidth(view.bounds), CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0f - CGRectGetHeight(view.bounds) / 2.0f, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
            [[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView addSubview:view];
        }
        [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.backgroundImageView.image = [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView.nativeAd.mainImage;
    }
}

+(BOOL) splashNativeAdReadyForPlacementID:(NSString*)placementID {
    return [[UPArpuAdManager sharedManager] nativeAdReadyForPlacementID:placementID];
}

-(void) skipButtonTapped {
    if ([UPArpuNativeSplashWrapper sharedWrapper].currentSplashView != nil) {
        NSString *placementID = [[[UPArpuNativeSplashWrapper sharedWrapper].currentSplashView embededAdView] valueForKeyPath:@"currentOffer.placementModel.placementID"];
        id<UPArpuNativeSplashDelegate> delegate = [self delegateForPlacementID:placementID];
        if ([delegate respondsToSelector:@selector(didCloseNativeSplashAdForPlacementID:)]) {
            [delegate didCloseNativeSplashAdForPlacementID:placementID];
        }
        [UPArpuNativeSplashWrapper sharedWrapper].currentSplashView = nil;
    }
}

#pragma mark - native delegate(s)
-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPArpuNativeSplashWrapper:: didStartPlayingVideoInAdView:placementID:%@", placementID);
}

-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPArpuNativeSplashWrapper:: didEndPlayingVideoInAdView:placementID:%@", placementID);
}

-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPArpuNativeSplashWrapper:: didClickNativeAdInAdView:placementID:%@", placementID);
    id<UPArpuNativeSplashDelegate> delegate = [self delegateForPlacementID:placementID];
    if ([delegate respondsToSelector:@selector(didCloseNativeSplashAdForPlacementID:)]) {
        [delegate didClickNaitveSplashAdForPlacementID:placementID];
    }
}

-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPArpuNativeSplashWrapper:: didShowNativeAdInAdView:placementID:%@", placementID);
    adView.mainImageView.image = adView.nativeAd.mainImage;
    NSTimeInterval interval = 5.0f;
    if ([objc_getAssociatedObject([UPArpuNativeSplashWrapper sharedWrapper], (__bridge_retained void*)kUPArpuNativeSplashShowingExtraCountdownIntervalKey) integerValue] > .0f) {
        interval = [objc_getAssociatedObject([UPArpuNativeSplashWrapper sharedWrapper], (__bridge_retained void*)kUPArpuNativeSplashShowingExtraCountdownIntervalKey) integerValue];
    }
    [[UPArpuNativeSplashWrapper sharedWrapper] startCountdown:interval];
    id<UPArpuNativeSplashDelegate> delegate = [self delegateForPlacementID:placementID];
    if ([delegate respondsToSelector:@selector(didShowNativeSplashAdForPlacementID:)]) {
        [delegate didShowNativeSplashAdForPlacementID:placementID];
    }
}

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"UPArpuNativeSplashWrapper:: didFinishLoadingADWithPlacementID:%@", placementID);
    id<UPArpuNativeSplashDelegate> delegate = [self delegateForPlacementID:placementID];
    if ([delegate respondsToSelector:@selector(finishLoadingNativeSplashAdForPlacementID:)]) { [delegate finishLoadingNativeSplashAdForPlacementID:placementID]; }
}

-(void) didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    NSLog(@"UPArpuNativeSplashWrapper:: didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
    id<UPArpuNativeSplashDelegate> delegate = [self delegateForPlacementID:placementID];
    if ([delegate respondsToSelector:@selector(failedToLoadNativeSplashAdForPlacementID:error:)]) { [delegate failedToLoadNativeSplashAdForPlacementID:placementID error:error]; }
}
@end

#pragma mark - al category impl
@implementation UIView(Autolayout)
+(instancetype) internal_autolayoutView {
    UIView *view = [[self alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

- (NSArray<__kindof NSLayoutConstraint *> *)internal_addConstraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary<NSString *,id> *)metrics views:(NSDictionary<NSString *, id> *)views {
    NSArray<__kindof NSLayoutConstraint*>* constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:opts metrics:metrics views:views];
    [self addConstraints:constraints];
    return constraints;
}

-(NSLayoutConstraint*)internal_addConstraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:c];
    [self addConstraint:constraint];
    return constraint;
}
@end

@implementation UILabel(Autolayout)
+(instancetype) internal_autolayoutLabelFont:(UIFont*)font textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [UILabel internal_autolayoutView];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

+(instancetype) internal_autolayoutLabelFont:(UIFont*)font textColor:(UIColor*)textColor {
    return [self internal_autolayoutLabelFont:font textColor:textColor textAlignment:NSTextAlignmentLeft];
}
@end

@implementation UIButton(Autolayout)
+(instancetype) internal_autolayoutButtonWithType:(UIButtonType)type {
    UIButton *button = [UIButton buttonWithType:type];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    return button;
}
@end
