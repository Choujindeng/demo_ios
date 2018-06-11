//
//  UPNativeADView.h
//  UpArpuSDK
//
//  Created by Martin Lau on 18/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UPArpuNativeAd.h"
#import "UPNativeRendering.h"
/**
 * Subclasses are expected to call super when overriding willMoveToSuperview: because it it within this method the base class kick off the rendering process.
 */
@protocol UPArpuNativeADDelegate;
@protocol UPNativeADRenderer;
@interface UPNativeADView : UIView<UPNativeRendering>
/**
 * Designated initailizer
 * Loading delegate need to be passed because during the showing process, it's still posibile to encounter loading failure.
 */
-(instancetype) initWithFrame:(CGRect)frame placementID:(NSString*)placementID renderer:(id<UPNativeADRenderer>)renderer delegate:(id<UPArpuNativeADDelegate>)delegate;
/**
 * Subclass implementation has to call [super initSubviews] for the ad view to work properly. By the time this method's called, the ad view is not yet full fledged.
 */
-(void) initSubviews;

/**
 * Create constraints for subviews in this method if you are using autolayout.
 */
-(void) makeConstraintsForSubviews;

/**
 * Whether the ad being shown is a video ad.
 */
-(BOOL) isVideoContents;

@property(nonatomic, weak) id<UPArpuNativeADDelegate> delegate;
/**
 * The view that is used to play video or other media; it is set by the sdk; might be nil.
 */
@property(nonatomic) UIView *mediaView;
/**
 * The native ad that is being shown.
 */
@property(nonatomic, readonly) UPArpuNativeAd *nativeAd;
@end
