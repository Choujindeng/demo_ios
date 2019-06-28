//
//  MTGBidAdapter.m
//  HeadBidingMediationSample
//
//  Created by CharkZhang on 2019/4/10.
//  Copyright © 2019 Mintegral. All rights reserved.
//

#import "MTGBidAdapter.h"
#import "MTGSDKBidding/MTGBiddingRequest.h"

NSString * const MTGErrorDomain = @"com.mintegral";

@implementation MTGBidAdapter

-(void)dealloc{
    DLog(@"");
}

-(void)getBidNetwork:(HBBidNetworkItem *)networkItem adFormat:(HBAdBidFormat)format responseCallback:(void (^)(HBAdBidResponse * _Nonnull))callback{

    id apiKeyObj = [networkItem.extraParams objectForKey:@"apiKey"];
    NSString *apiKey = [NSString stringWithFormat:@"%@",apiKeyObj];
    if (networkItem.appId.length == 0 || apiKey.length == 0 || networkItem.unitId.length == 0) {

        NSString *errorMsg = @"Require Input Params for Mintegral is invalid";
        NSError *error = [HBAdBidError errorWithDomain:MTGErrorDomain code:GDBidErrorInputParamersInvalid userInfo:@{NSLocalizedDescriptionKey : errorMsg}];
        HBAdBidResponse *response = [HBAdBidResponse buildResponseWithError:error];
        callback(response);
        return;
    }

    [[MTGSDK sharedInstance] setAppID:networkItem.appId ApiKey:apiKey];
    [MTGBiddingRequest getBidWithUnitId:networkItem.unitId basePrice:0 completionHandler:^(MTGBiddingResponse * _Nonnull bidResponse) {

        HBAdBidResponse *response = [self buildAdBidResponse:bidResponse networkItem:networkItem];
        callback(response);

    }];
}

- (HBAdBidResponse *)buildAdBidResponse:(MTGBiddingResponse *)bidResponse networkItem:(HBBidNetworkItem *)networkItem{
    HBAdBidResponse *response = nil;
    if (!bidResponse.success) {
        NSString *errorMsg = bidResponse.error.debugDescription;
        NSError *error = [HBAdBidError errorWithDomain:MTGErrorDomain code:GDBidErrorNetworkBidFailed userInfo:@{NSLocalizedDescriptionKey : errorMsg}];
        response = [HBAdBidResponse buildResponseWithError:error];
        return response;
    }
    response = [HBAdBidResponse buildResponseWithPrice:bidResponse.price currency:bidResponse.currency payLoad:bidResponse.bidToken  network:networkItem adsRender:nil notifyWin:^{
        [bidResponse notifyWin];
    } notifyLoss:^{
        [bidResponse notifyLoss:(MTGBidLossedReasonCodeLowPrice)];
    }];
    return response;
}
@end
