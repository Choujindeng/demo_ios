//
//  UPArpuNativeADConfiguration.h
//  UpArpuSDK
//
//  Created by Martin Lau on 20/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
extern NSString *const kUPArpuNativeAdConfigurationContextAdOptionsViewFrameKey;//CGRect wrapped as NSValue, supported by facebook
extern NSString *const kUPArpuNativeAdConfigurationContextAdLogoViewFrameKey;//CGRect wrapped as NSValue, supported by gdt&baidu, defaults to top-left corner
extern NSString *const kUPArpuNativeAdConfigurationContextNetworkLogoViewFrameKey;//CGRect wrapped as NSValue, support by baidu, defaults to bottom-right corner
@protocol UPArpuNativeADDelegate;
@interface UPArpuNativeADConfiguration : NSObject
/**
 You can store some extra network specific context info in this dictionary.
 */
@property(nonatomic) NSDictionary *context;
@property(nonatomic) Class renderingViewClass;
@property(nonatomic) CGRect ADFrame;
@property(nonatomic) CGRect mediaViewFrame;
@property(nonatomic, weak) UIViewController *rootViewController;
@property(nonatomic, weak) id<UPArpuNativeADDelegate> delegate;
@end
