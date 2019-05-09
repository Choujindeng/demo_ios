//
//  UPArpuNativeADConfiguration.h
//  UpArpuSDK
//
//  Created by Martin Lau on 20/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol UPArpuNativeADDelegate;
@interface UPArpuNativeADConfiguration : NSObject
/**
 You can store some extra network specific context info in this dictionary.
 */
@property(nonatomic) NSDictionary *context;
@property(nonatomic) Class renderingViewClass;
@property(nonatomic) CGRect ADFrame;
@property(nonatomic, weak) UIViewController *rootViewController;
@property(nonatomic, weak) id<UPArpuNativeADDelegate> delegate;
@end
