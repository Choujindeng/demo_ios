//
//  FBBidAdapter.m
//  HeadBidingMediationSample
//
//  Created by CharkZhang on 2019/4/10.
//  Copyright © 2019 Mintegral. All rights reserved.
//

#import "FBBidAdapter.h"

#import <FBAudienceNetworkBiddingKit/FBAudienceNetworkBiddingKit.h>

NSString * const FBErrorDomain = @"com.facebook";

@implementation FBBidAdapter


-(void)dealloc{
    DLog(@"");
}

-(void)getBidNetwork:(HBBidNetworkItem *)networkItem adFormat:(HBAdBidFormat)format responseCallback:(void (^)(HBAdBidResponse * _Nonnull))callback{

    __block FBAdBidFormat currentAdFormat;
    NSError *error = nil;
    [self convertWithHBAdBidFormat:format result:^(FBAdBidFormat fbFormat, NSError *error) {
        currentAdFormat = fbFormat;
    }];
    if (error) {
        HBAdBidResponse *response = [HBAdBidResponse buildResponseWithError:error withNetwork:networkItem];
        callback(response);
        return;
    }

    if (networkItem.testMode) {

        [FBAdBidRequest getAudienceNetworkTestBidForAppID:networkItem.appId
                                              placementID:networkItem.unitId
                                               platformID:networkItem.platformId
                                                 adFormat:currentAdFormat
                                             maxTimeoutMS:networkItem.maxTimeoutMS
                                         responseCallback:^(FBAdBidResponse * _Nonnull bidResponse) {
        
        HBAdBidResponse *response = [self buildAdBidResponse:bidResponse networkItem:networkItem];
        callback(response);
    }];
    }else{
        [FBAdBidRequest getAudienceNetworkBidForAppID:networkItem.appId
                                          placementID:networkItem.unitId
                                           platformID:networkItem.platformId
                                             adFormat:currentAdFormat
                                     responseCallback:^(FBAdBidResponse * _Nonnull bidResponse) {

            HBAdBidResponse *response = [self buildAdBidResponse:bidResponse networkItem:networkItem];
            callback(response);
        }];
    }
}

- (HBAdBidResponse *)buildAdBidResponse:(FBAdBidResponse *)bidResponse networkItem:(HBBidNetworkItem *)networkItem{
    HBAdBidResponse *response = nil;
    if (!bidResponse.isSuccess) {
        NSString *errorMsg = [bidResponse getErrorMessage];
        NSError *error = [HBAdBidError errorWithDomain:FBErrorDomain code:GDBidErrorNetworkBidFailed userInfo:@{NSLocalizedDescriptionKey : errorMsg}];
        response = [HBAdBidResponse buildResponseWithError:error withNetwork:networkItem];
        return response;
    }
    response = [HBAdBidResponse buildResponseWithPrice:bidResponse.getPrice currency:bidResponse.getCurrency payLoad:bidResponse.getPayload network:networkItem adsRender:nil notifyWin:^{
        [bidResponse notifyWin];
    } notifyLoss:^{
        [bidResponse notifyLoss];
    }];
    return response;
}

- (void)convertWithHBAdBidFormat:(HBAdBidFormat)format result:(void(^)(FBAdBidFormat fbFormat,NSError *error))callback{
    
    FBAdBidFormat fbFormat;
    NSError *error = nil;
    switch (format) {
        case HBAdBidFormatNative:
            fbFormat = FBAdBidFormatNative;
            break;
        case HBAdBidFormatInterstitial:
            fbFormat = FBAdBidFormatInterstitial;
            break;
        case HBAdBidFormatRewardedVideo:
            fbFormat = FBAdBidFormatRewardedVideo;
            break;
        default:
        {
            NSString *errorMsg = @"Current network still not support this adFormat";
            error = [HBAdBidError errorWithDomain:FBErrorDomain code:GDBidErrorNetworkNotSupportCurrentAdFormat userInfo:@{NSLocalizedDescriptionKey : errorMsg}];

        }
            break;
    }

    callback(fbFormat,error);
}

@end

