//
//  UPArpuHeaderBiddingManager.h
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 2019/6/18.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, UPArpuHBAdBidFormat) {
    // Bid For Native Ad
    UPArpuHBAdBidFormatNative = 1,
    // Bid For Interstitial Ad
    UPArpuHBAdBidFormatInterstitial,
    // Bid For Rewarded Video Ad
    UPArpuHBAdBidFormatRewardedVideo,
};

typedef NS_ENUM(NSInteger, UPArpuHBAdBidNetwork) {
    
    UPArpuHBAdBidNetworkFacebook = 1,
    UpArpuHBAdBidNetworkMintegral,// will support later
};

@protocol UPArpuAdSource;
@protocol UPArpuHeaderBiddingAdSource;
@interface UPArpuHeaderBiddingManager : NSObject
+(instancetype) sharedManager;
-(void) runHeaderBiddingWithForamt:(UPArpuHBAdBidFormat)format unitID:(NSString*)unitID adSources:(NSArray<id<UPArpuAdSource>>*)adsrouces headerBiddingAdSources:(NSArray<id<UPArpuHeaderBiddingAdSource>>*)HBAdSources timeout:(NSTimeInterval)timeout completion:(void(^)(NSArray<id<UPArpuAdSource>>*, NSError*))completion;
@end

@protocol UPArpuAdSource<NSObject>
@property(nonatomic, readonly) double price;
@property(nonatomic, readonly) UPArpuHBAdBidNetwork network;
@end

extern NSString *const kUPArpuHeaderBiddingAdSourceInfoAppIDKey;
extern NSString *const kUPArpuHeaderBiddingAdSourceInfoUnitIDKey;
@protocol UPArpuHeaderBiddingAdSource<UPArpuAdSource>
@property(nonatomic, readonly) NSDictionary *adSrouceInfo;
@property(nonatomic, readwrite) double bidPrice;
@property(nonatomic, readwrite) id bidToken;
@property(nonatomic, readonly) NSTimeInterval headerBiddingRequestTimeout;
@end

@protocol UPArpuHBBidNetworkItem<NSObject>
+ (instancetype)buildItemNetwork:(UPArpuHBAdBidNetwork)network customEventClassName:(NSString *)className appId:(NSString *)appId unitId:(NSString *)unitId;
@property (nonatomic,assign)  UPArpuHBAdBidNetwork network;
@property (nonatomic,  copy)  NSString *unitId;
@property (nonatomic,strong)  NSDictionary *extraParams;
@property (nonatomic,assign)  NSInteger maxTimeoutMS;
@property (nonatomic,  copy)  NSString *platformId;
@property (nonatomic,assign)  BOOL      testMode;
@end

@protocol UPArpuHBAdBidResponse<UPArpuAdSource>
@property (nonatomic,copy,  readonly) NSString *unitId;
@property (nonatomic,copy,  readonly) NSObject *payLoad;
@property (nonatomic,assign,readonly) double price;
@property (nonatomic,copy,  readonly) NSString *currency;
@property (nonatomic,assign,readonly) BOOL success;
@property (nonatomic,strong,readonly) NSError *error;
@property (nonatomic,strong,readonly) id<UPArpuHBBidNetworkItem> networkItem;
@end

@protocol UPArpuHBAuctionResult<NSObject>
@property (nonatomic,strong,readonly) id<UPArpuHBAdBidResponse> winner;
@property (nonatomic,strong,readonly) NSArray<id<UPArpuHBAdBidResponse>> *otherResponse;
@end

@protocol UPArpuHBAdsBidRequest<NSObject>
+ (void)getBidNetworks:(NSArray<id<UPArpuHBBidNetworkItem>>*)networkItems unitId:(NSString *)unitId adFormat:(UPArpuHBAdBidFormat)format maxTimeoutMS:(NSInteger)maxTimeoutMS responseCallback:(void(^)(id<UPArpuHBAuctionResult> auctionResponse, NSError *error))callback;
@end
