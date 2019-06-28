//
//  UPArpuHeaderBiddingManager.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 2019/6/18.
//  Copyright © 2019 Martin Lau. All rights reserved.
//

#import "UPArpuHeaderBiddingManager.h"
#import <objc/runtime.h>
NSString *const kUPArpuHeaderBiddingAdSourceInfoAppIDKey = @"app_id";
NSString *const kUPArpuHeaderBiddingAdSourceInfoUnitIDKey = @"unit_id";
static NSString *const kUPArpuHeaderBiddingNetworkItemUnitIDAssociateKey = @"associate_unit_id";
@implementation UPArpuHeaderBiddingManager
+(instancetype)sharedManager {
    static UPArpuHeaderBiddingManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[UPArpuHeaderBiddingManager alloc] init];
    });
    return sharedManager;
}

NSUInteger FindPositionToInsert(NSArray *adsources, id HBAdSource, BOOL (^condition)(id, id)) {
    __block NSUInteger index = [adsources count];
    [adsources enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (condition(obj, HBAdSource)) {
            index = idx;
            *stop = YES;
        }
    }];
    return index;
}

NSArray* CombineAdSources(NSArray* des, NSArray* src, BOOL(^condition)(id adSource, id HBAdSource)) {
    NSMutableArray* sortedAdsources = [des count] > 0 ? [NSMutableArray arrayWithArray:des] : [NSMutableArray array];
    [src enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [sortedAdsources insertObject:obj atIndex:FindPositionToInsert(sortedAdsources, obj, condition)];
    }];
    return sortedAdsources;
}

NSString* CustomEventClassName(UPArpuHBAdBidNetwork network) {
    return @{@(UPArpuHBAdBidNetworkFacebook):@"FBBidAdapter", @(UpArpuHBAdBidNetworkMintegral):@"MTGBidAdapter"}[@(network)];
}

NSString *NetworkItemHBAdSourceMapKey(id<UPArpuHBBidNetworkItem> networkItem) {
    return [NSString stringWithFormat:@"%ld_%@", networkItem.network, networkItem.unitId];
}

-(void) runHeaderBiddingWithForamt:(UPArpuHBAdBidFormat)format unitID:(NSString*)unitID adSources:(NSArray<id<UPArpuAdSource>>*)adSources headerBiddingAdSources:(NSArray<id<UPArpuHeaderBiddingAdSource>>*)HBAdSources timeout:(NSTimeInterval)timeout completion:(void(^)(NSArray<id<UPArpuAdSource>>*, NSError*))completion {
    if (NSClassFromString(@"HBBidNetworkItem") != nil && NSClassFromString(@"HBAdsBidRequest") != nil) {
        NSMutableArray<id<UPArpuHBBidNetworkItem>> *netwrokItems = [NSMutableArray<id<UPArpuHBBidNetworkItem>> array];
        NSMutableArray<id<UPArpuHeaderBiddingAdSource>> *unsupportedAdSources = [NSMutableArray<id<UPArpuHeaderBiddingAdSource>> array];
        NSMutableDictionary<NSString*, id<UPArpuHeaderBiddingAdSource>>*networkItemAdSourceMap = [NSMutableDictionary<NSString*, id<UPArpuHeaderBiddingAdSource>> dictionary];
        
        [HBAdSources enumerateObjectsUsingBlock:^(id<UPArpuHeaderBiddingAdSource>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (CustomEventClassName(obj.network) != nil) {
                id<UPArpuHBBidNetworkItem> networkItem = [NSClassFromString(@"HBBidNetworkItem") buildItemNetwork:obj.network customEventClassName:CustomEventClassName(obj.network) appId:obj.adSrouceInfo[kUPArpuHeaderBiddingAdSourceInfoAppIDKey] unitId:obj.adSrouceInfo[kUPArpuHeaderBiddingAdSourceInfoUnitIDKey]];
                networkItem.extraParams = obj.adSrouceInfo;
                networkItem.maxTimeoutMS = obj.headerBiddingRequestTimeout;
                networkItem.platformId = obj.adSrouceInfo[kUPArpuHeaderBiddingAdSourceInfoAppIDKey];
//                networkItem.testMode = YES;
                [netwrokItems addObject:networkItem];
                networkItemAdSourceMap[NetworkItemHBAdSourceMapKey(networkItem)] = obj;
            } else {
                NSLog(@"Network:%ld's not supported yet", obj.network);
                [unsupportedAdSources addObject:obj];
            }
        }];
        
        if ([netwrokItems count] > 0) {
            [NSClassFromString(@"HBAdsBidRequest") getBidNetworks:netwrokItems unitId:unitID adFormat:format maxTimeoutMS:timeout responseCallback:^(id<UPArpuHBAuctionResult> result, NSError *error) {
                if (result != nil) {
                    completion(CombineAdSources([UPArpuHeaderBiddingManager combineAuctionResult:result withNonHBAdSources:adSources networkItemAdSourceMap:networkItemAdSourceMap], unsupportedAdSources, ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) { return HBAdSource.price >= adSource.price; }), nil);
                } else {
                    NSLog(@"Error occured while running header bidding request:%@; will combine non-header bidding adsource&header bidding adsource with ecpm floor.", error);
                    completion(CombineAdSources(adSources, HBAdSources, ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) {
                        return HBAdSource.price >= adSource.price;
                    }), nil);
                }
            }];
        } else {
            NSLog(@"No header bidding supported adsource found, will combine non-header bidding adsource&header bidding adsource with ecpm floor.");
            completion(CombineAdSources(adSources, HBAdSources, ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) {
                return HBAdSource.price >= adSource.price;
            }), nil);
        }
    } else {
        NSLog(@"HiBid framework not imported properly, will sort adsources by their ecpm floor");
        completion(CombineAdSources(adSources, HBAdSources, ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) {
            return HBAdSource.price >= adSource.price;
        }), nil);
    }
}

+(NSArray<id<UPArpuAdSource>>*)combineAuctionResult:(id<UPArpuHBAuctionResult>)auctionResult withNonHBAdSources:(NSArray<id<UPArpuAdSource>>*)nonHBAdSources networkItemAdSourceMap:(NSDictionary<NSString*, id<UPArpuHeaderBiddingAdSource>>*)networkItemAdSourceMap {
    void (^ConfigBidResponse)(id<UPArpuHeaderBiddingAdSource> HBAdSource, id<UPArpuHBAdBidResponse> HBResponse) = ^(id<UPArpuHeaderBiddingAdSource> HBAdSource, id<UPArpuHBAdBidResponse> HBResponse) {
        if ([HBAdSource respondsToSelector:@selector(bidPrice)] && [HBAdSource respondsToSelector:@selector(bidToken)] && [HBResponse respondsToSelector:@selector(price)] && [HBResponse respondsToSelector:@selector(payLoad)]) {
            HBAdSource.bidPrice = HBResponse.price;
            HBAdSource.bidToken = HBResponse.payLoad;
        }
    };
    
    NSMutableArray<NSString*>* keysForSucAdSources = [NSMutableArray<NSString*> array];
    NSMutableArray<id<UPArpuHeaderBiddingAdSource>> *HBAdSources = [NSMutableArray<id<UPArpuHeaderBiddingAdSource>> array];
    id<UPArpuHeaderBiddingAdSource> winderAdSource = networkItemAdSourceMap[NetworkItemHBAdSourceMapKey(auctionResult.winner.networkItem)];
    if (winderAdSource != nil) {
        [keysForSucAdSources addObject:NetworkItemHBAdSourceMapKey(auctionResult.winner.networkItem)];
        ConfigBidResponse(winderAdSource, auctionResult.winner);
        [HBAdSources addObject:winderAdSource];
    }
    
    [auctionResult.otherResponse enumerateObjectsUsingBlock:^(id<UPArpuHBAdBidResponse>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.success) {
            NSString *key = NetworkItemHBAdSourceMapKey(obj.networkItem);
            id<UPArpuHeaderBiddingAdSource> HBAdSource = networkItemAdSourceMap[key];
            if (HBAdSource != nil) {
                ConfigBidResponse(HBAdSource, obj);
                [HBAdSources addObject:HBAdSource];
                [keysForSucAdSources addObject:key];
            }
        }
    }];
    [HBAdSources sortUsingComparator:^NSComparisonResult(id<UPArpuHeaderBiddingAdSource>  _Nonnull obj1, id<UPArpuHeaderBiddingAdSource>  _Nonnull obj2) { return [@(obj1.bidPrice) compare:@(obj2.bidPrice)]; }];
    
    NSArray<id<UPArpuAdSource>>* adSource = CombineAdSources(nonHBAdSources, HBAdSources, ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) {
        return HBAdSource.bidPrice >= adSource.price;
    });
    NSMutableDictionary *adsourceMap = [NSMutableDictionary dictionaryWithDictionary:networkItemAdSourceMap];
    if ([keysForSucAdSources count] > 0) { [adsourceMap removeObjectsForKeys:keysForSucAdSources]; }
    adSource = CombineAdSources(adSource, [adsourceMap allValues], ^BOOL(id<UPArpuAdSource> adSource, id<UPArpuHeaderBiddingAdSource> HBAdSource) {
        return HBAdSource.price >= adSource.price;
    });
    return adSource;
}
@end
