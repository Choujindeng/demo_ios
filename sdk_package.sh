#!/bin/bash
############################################################################
##                支持根据network选择不同的库文件进行打包                     ##
############################################################################
SDK_Path='AnyThinkSDKDemo/SDK'
SDK_TopOn_Path="/"
SDK_TopOn=("AnyThinkSDK.framework" "AnyThinkSDK.bundle" "AnyThinkNative.framework" "AnyThinkSplash.framework" "AnyThinkInterstitial.framework" "AnyThinkRewardedVideo.framework" "AnyThinkBanner.framework" "AnyThinkHeaderBidding.framework" "AnyThinkSDK.bundle" "AnyThinkMyOffer.framework" "AnyThinkMyOfferInterstitialAdapter.framework"  "AnyThinkMyOfferRewardedVideoAdapter.framework" )
SDK_Admob_Path="/"
SDK_Admob=("AnyThinkAdmobBannerAdapter.framework" "AnyThinkAdmobInterstitialAdapter.framework" "AnyThinkAdmobRewardedVideoAdapter.framework" "AnyThinkAdmobNativeAdapter.framework" "GoogleMobileAds.framework" "PersonalizedAdConsent.framework")
SDK_Facebook_Path="/"
SDK_Facebook=("AnyThinkFacebookBannerAdapter.framework" "AnyThinkFacebookInterstitialAdapter.framework" "AnyThinkFacebookRewardedVideoAdapter.framework" "AnyThinkFacebookNativeAdapter.framework" "FBAudienceNetwork.framework" "FBAudienceNetworkBiddingKit.framework" "FBSDKCoreKit.framework")
SDK_Inmobi_Path="/"
SDK_Inmobi=("AnyThinkInmobiBannerAdapter.framework" "AnyThinkInmobiInterstitialAdapter.framework" "AnyThinkInmobiRewardedVideoAdapter.framework" "AnyThinkInmobiNativeAdapter.framework" "InMobiSDK.framework")
SDK_Flurry_Path="/"
SDK_Flurry=("AnyThinkFlurryBannerAdapter.framework" "AnyThinkFlurryInterstitialAdapter.framework" "AnyThinkFlurryRewardedVideoAdapter.framework" "AnyThinkFlurryNativeAdapter.framework" "Flurry")
SDK_Applovin_Path="/"
SDK_Applovin=("AnyThinkApplovinBannerAdapter.framework" "AnyThinkApplovinInterstitialAdapter.framework" "AnyThinkApplovinRewardedVideoAdapter.framework" "AnyThinkApplovinNativeAdapter.framework" "AppLovinSDK.framework" "AppLovinSDKResources.bundle")
SDK_Mintegral_Path="/"
SDK_Mintegral=("AnyThinkMintegralBannerAdapter.framework" "AnyThinkMintegralInterstitialAdapter.framework" "AnyThinkMintegralRewardedVideoAdapter.framework" "AnyThinkMintegralNativeAdapter.framework" "MTGSDK.framework" "MTGSDKBanner.framework" "MTGSDKBidding.framework" "MTGSDKInterstitial.framework" "MTGSDKInterstitialVideo.framework" "MTGSDKReward.framework")
SDK_Mopub_Path="/"
SDK_Mopub=("AnyThinkMopubBannerAdapter.framework" "AnyThinkMopubInterstitialAdapter.framework" "AnyThinkMopubRewardedVideoAdapter.framework" "AnyThinkMopubNativeAdapter.framework" "MoPubSDKFramework.framework")
SDK_GDT_Path="/"
SDK_GDT=("AnyThinkGDTBannerAdapter.framework" "AnyThinkGDTInterstitialAdapter.framework" "AnyThinkGDTRewardedVideoAdapter.framework" "AnyThinkGDTNativeAdapter.framework" "AnyThinkGDTSplashAdapter.framework" "GDT")
SDK_Yeahmobi_Path="/"
SDK_Yeahmobi=("AnyThinkYeahmobiBannerAdapter.framework" "AnyThinkYeahmobiInterstitialAdapter.framework" "AnyThinkYeahmobiRewardedVideoAdapter.framework" "AnyThinkYeahmobiNativeAdapter.framework" "MoPubSDKFramework.framework")
SDK_Appnext_Path="/"
SDK_Appnext=("AnyThinkAppnextBannerAdapter.framework" "AnyThinkAppnextInterstitialAdapter.framework" "AnyThinkAppnextRewardedVideoAdapter.framework" "AnyThinkAppnextNativeAdapter.framework" "AppnextIOSSDK" "AppnextNativeAdsSDK")
SDK_Chartboost_Path="/"
SDK_Chartboost=("AnyThinkChartboostInterstitialAdapter.framework" "AnyThinkChartboostRewardedVideoAdapter.framework" "Chartboost.framework")
SDK_IronSource_Path="/"
SDK_IronSource=("AnyThinkIronSourceInterstitialAdapter.framework" "AnyThinkIronSourceRewardedVideoAdapter.framework" "IronSource.framework")
SDK_Vungle_Path="/"
SDK_Vungle=("AnyThinkVungleInterstitialAdapter.framework" "AnyThinkVungleRewardedVideoAdapter.framework" "VungleSDK.framework")
SDK_Adcolony_Path="/"
SDK_Adcolony=("AnyThinkAdcolonyInterstitialAdapter.framework" "AnyThinkAdcolonyRewardedVideoAdapter.framework" "AdColony.framework")
SDK_UnityAds_Path="/"
SDK_UnityAds=("AnyThinkUnityAdsInterstitialAdapter.framework" "AnyThinkUnityAdsRewardedVideoAdapter.framework" "UnityAds.framework")
SDK_TT_Path="/"
SDK_TT=("AnyThinkTTBannerAdapter.framework" "AnyThinkTTInterstitialAdapter.framework" "AnyThinkTTRewardedVideoAdapter.framework" "AnyThinkTTNativeAdapter.framework" "AnyThinkTTSplashAdapter.framework" "BUAdSDK.bundle" "BUAdSDK.framework")
SDK_Tapjoy_Path="/"
SDK_Tapjoy=("AnyThinkTapjoyInterstitialAdapter.framework" "AnyThinkTapjoyRewardedVideoAdapter.framework" "Tapjoy.embeddedframework")
SDK_Oneway_Path="/"
SDK_Oneway=("AnyThinkOnewayInterstitialAdapter.framework" "AnyThinkOnewayRewardedVideoAdapter.framework" "Oneway")
SDK_Baidu_Path="/"
SDK_Baidu=("AnyThinkBaiduBannerAdapter.framework" "AnyThinkBaiduInterstitialAdapter.framework" "AnyThinkBaiduRewardedVideoAdapter.framework" "AnyThinkBaiduNativeAdapter.framework" "AnyThinkBaiduSplashAdapter.framework" "BaiduMobAdSDK.framework" "baidumobadsdk.bundle")
SDK_Nend_Path="/"
SDK_Nend=("AnyThinkNendBannerAdapter.framework" "AnyThinkNendInterstitialAdapter.framework" "AnyThinkNendRewardedVideoAdapter.framework" "AnyThinkNendNativeAdapter.framework" "NendAd.embeddedframework")
SDK_Maio_Path="/"
SDK_Maio=("AnyThinkMaioInterstitialAdapter.framework" "AnyThinkMaioRewardedVideoAdapter.framework" "Maio.framework")
SDK_KS_Path="/"
SDK_KS=("AnyThinkKSInterstitialAdapter.framework" "AnyThinkKSRewardedVideoAdapter.framework" "KSAdSDK.bundle" "KSAdSDK.framework" "thirdRely")
SDK_Sigmob_Path="/"
SDK_Sigmob=("AnyThinkSigmobInterstitialAdapter.framework" "AnyThinkSigmobRewardedVideoAdapter.framework" "AnyThinkSigmobSplash.framework"  "Sigmob.bundle" "WindSDK.framework")
SDK_Ogury_Path="/"
SDK_Ogury=("AnyThinkOguryInterstitialAdapter.framework" "AnyThinkOguryRewardedVideoAdapter.framework" "OguryOED_1.0.3")

SDK_TopOn_Pod="pod 'AnyThinkiOS'"
SDK_Facebook_Pod="pod 'AnyThinkiOS/AnyThinkFacebookAdapter'"
SDK_Facebook_Pod1="pod 'FBAudienceNetwork' , '5.5.1'"
SDK_Admob_Pod="pod 'AnyThinkiOS/AnyThinkAdmobAdapter'"
SDK_Admob_Pod1="pod 'Google-Mobile-Ads-SDK','7.52.0'"
SDK_Admob_Pod2="pod 'PersonalizedAdConsent'"
SDK_Inmobi_Pod="pod 'AnyThinkiOS/AnyThinkInmobiAdapter'"
SDK_Inmobi_Pod1="pod 'InMobiSDK' ,'7.3.1'"
SDK_Flurry_Pod="pod 'AnyThinkiOS/AnyThinkFlurryAdapter'"
SDK_Flurry_Pod1="#第三方不支持pod,请另行下载"
SDK_Applovin_Pod="pod 'AnyThinkiOS/AnyThinkApplovinAdapter'"
SDK_Applovin_Pod1="pod 'AppLovinSDK', '6.10.0'"
SDK_Mintegral_Pod="pod 'AnyThinkiOS/AnyThinkMintegralAdapter'"
SDK_Mintegral_Pod1="pod 'MintegralAdSDK' ,'5.8.7'"
SDK_Mintegral_Pod2="pod 'MintegralAdSDK/RewardVideoAd','5.8.7'"
SDK_Mintegral_Pod3="pod 'MintegralAdSDK/BidRewardVideoAd','5.8.7'"
SDK_Mintegral_Pod4="pod 'MintegralAdSDK/BidInterstitialVideoAd','5.8.7'"
SDK_Mintegral_Pod5="pod 'MintegralAdSDK/InterstitialVideoAd','5.8.7'"
SDK_Mintegral_Pod6="pod 'MintegralAdSDK/InterstitialAd','5.8.7'"
SDK_Mintegral_Pod7="pod 'MintegralAdSDK/BannerAd' ,'5.8.7'"
SDK_Mintegral_Pod8="pod 'MintegralAdSDK/BidBannerAd','5.8.7'"
SDK_Mopub_Pod="pod 'AnyThinkiOS/AnyThinkMopubAdapter'"
SDK_Mopub_Pod1="pod 'mopub-ios-sdk', '5.10.0'"
SDK_GDT_Pod="pod 'AnyThinkiOS/AnyThinkGDTAdapter'"
SDK_GDT_Pod1="pod 'GDTMobSDK', '4.11.2'"
SDK_Chartboost_Pod="pod 'AnyThinkiOS/AnyThinkChartboostAdapter'"
SDK_Chartboost_Pod1="pod 'ChartboostSDK','8.0.3'"
SDK_Tapjoy_Pod="pod 'AnyThinkiOS/AnyThinkTapjoyAdapter'"
SDK_Tapjoy_Pod1="pod 'TapjoySDK','12.3.4'"
SDK_IronSource_Pod="pod 'AnyThinkiOS/AnyThinkIronSourceAdapter'"
SDK_IronSource_Pod1="pod 'IronSourceSDK','6.10.0'"
SDK_UnityAds_Pod="pod 'AnyThinkiOS/AnyThinkUnityAdsAdapter'"
SDK_UnityAds_Pod1="pod 'UnityAds' , '3.4.0'"
SDK_Vungle_Pod="pod 'AnyThinkiOS/AnyThinkVungleAdapter'"
SDK_Vungle_Pod1="pod 'VungleSDK-iOS', '6.4.6'"
SDK_Adcolony_Pod="pod 'AnyThinkiOS/AnyThinkAdcolonyAdapter'"
SDK_Adcolony_Pod1="pod 'AdColony','4.1.0.0'"
SDK_TT_Pod="pod 'AnyThinkiOS/AnyThinkTouTiaoAdapter'"
SDK_TT_Pod1="pod 'Bytedance-UnionAD' , '2.7.5.2'"
SDK_Oneway_Pod="pod 'AnyThinkiOS/AnyThinkOnewayAdapter'"
SDK_Oneway_Pod1="#第三方不支持pod,请另行下载"
SDK_Yeahmobi_Pod="pod 'AnyThinkiOS/AnyThinkYeahmobiAdapter'"
SDK_Yeahmobi_Pod1="pod 'CTSDK','3.2.0'"
SDK_Baidu_Pod="pod 'AnyThinkiOS/AnyThinkBaiduAdapter'"
SDK_Baidu_Pod1="pod 'BaiduMobAdSDK'"
SDK_Nend_Pod="pod 'AnyThinkiOS/AnyThinkNendAdapter'"
SDK_Nend_Pod1="pod 'NendSDK_iOS','5.3.1'"
SDK_Maio_Pod="pod 'AnyThinkiOS/AnyThinkMaioAdapter'"
SDK_Maio_Pod1="pod 'MaioSDK','1.5.0'"
SDK_Appnext_Pod="pod 'AnyThinkiOS/AnyThinkAppnextAdapter'"
SDK_Appnext_Pod1="#第三方不支持pod,请另行下载"
SDK_KS_Pod="pod 'AnyThinkiOS/AnyThinkKSAdapter'"
SDK_KS_Pod1="#第三方不支持pod,请另行下载"
SDK_Ogury_Pod="pod 'AnyThinkiOS/AnyThinkOguryAdapter'"
SDK_Ogury_Pod1="#第三方不支持pod,请另行下载"
SDK_Sigmob_Pod="pod 'AnyThinkiOS/AnyThinkSigmobAdapter'"
SDK_Sigmob_Pod1="pod 'SigmobAd-iOS', '2.15.2'"

input_nwfirmid_list=$1
input_country=$2
input_import_type=$3
release_folder="release_folder"
sdk_release="sdk_release_"
podDoc="pod.txt"
##根据输入的NetworkFirmId列表进行遍历，选择文件打出压缩包
package_files(){
	nwfirmid_array=(${input_nwfirmid_list//\,/ })
	rm -r ${release_folder}
	rm *.zip
	mkdir ${release_folder}
    rm *.txt

    if [ "${input_import_type}" -eq "1" ];then
        for i in "${!SDK_TopOn[@]}"; do
            # echo "$i=>${SDK_TopOn[i]}"
            cp -a "${SDK_Path}${SDK_TopOn_Path}${SDK_TopOn[i]}" "${release_folder}"
        done

        for i in "${!nwfirmid_array[@]}"; do
            echo "$i=>${nwfirmid_array[i]}"
            if [ "${nwfirmid_array[i]}" -eq "1" ];then
                echo "facebook"
                for j in "${!SDK_Facebook[@]}"; do
                    cp -a "${SDK_Path}${SDK_Facebook_Path}${SDK_Facebook[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "2" ];then
                echo "admob"
                for j in "${!SDK_Admob[@]}"; do
                    cp -a "${SDK_Path}${SDK_Admob_Path}${SDK_Admob[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "3" ];then
                echo "inmobi"
                for j in "${!SDK_Inmobi[@]}"; do
                    cp -a "${SDK_Path}${SDK_Inmobi_Path}${SDK_Inmobi[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "4" ];then
                echo "flurry"
                for j in "${!SDK_Flurry[@]}"; do
                    cp -a "${SDK_Path}${SDK_Flurry_Path}${SDK_Flurry[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "5" ];then
                echo "Applovin"
                for j in "${!SDK_Applovin[@]}"; do
                    cp -a "${SDK_Path}${SDK_Applovin_Path}${SDK_Applovin[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "6" ];then
                echo "Mintegral"
                for j in "${!SDK_Mintegral[@]}"; do
                    cp -a "${SDK_Path}${SDK_Mintegral_Path}${SDK_Mintegral[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "7" ];then
                echo "Mopub"
                for j in "${!SDK_Mopub[@]}"; do
                    cp -a "${SDK_Path}${SDK_Mopub_Path}${SDK_Mopub[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "8" ];then
                echo "GDT"
                for j in "${!SDK_GDT[@]}"; do
                    cp -a "${SDK_Path}${SDK_GDT_Path}${SDK_GDT[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "9" ];then
                echo "Chartboost"
                for j in "${!SDK_Chartboost[@]}"; do
                    cp -a "${SDK_Path}${SDK_Chartboost_Path}${SDK_Chartboost[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "10" ];then
                echo "Tapjoy"
                for j in "${!SDK_Tapjoy[@]}"; do
                    cp -a "${SDK_Path}${SDK_Tapjoy_Path}${SDK_Tapjoy[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "11" ];then
                echo "Ironsource"
                for j in "${!SDK_IronSource[@]}"; do
                    cp -a "${SDK_Path}${SDK_IronSource_Path}${SDK_IronSource[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "12" ];then
                echo "UnityAds"
                for j in "${!SDK_UnityAds[@]}"; do
                    cp -a "${SDK_Path}${SDK_UnityAds_Path}${SDK_UnityAds[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "13" ];then
                echo "Vungle"
                for j in "${!SDK_Vungle[@]}"; do
                    cp -a "${SDK_Path}${SDK_Vungle_Path}${SDK_Vungle[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "14" ];then
                echo "Adcolony"
                for j in "${!SDK_Adcolony[@]}"; do
                    cp -a "${SDK_Path}${SDK_Adcolony_Path}${SDK_Adcolony[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "15" ];then
                echo "TouTiao"
                for j in "${!SDK_TT[@]}"; do
                    cp -a "${SDK_Path}${SDK_TT_Path}${SDK_TT[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "17" ];then
                echo "Oneway"
                for j in "${!SDK_Oneway[@]}"; do
                    cp -a "${SDK_Path}${SDK_Oneway_Path}${SDK_Oneway[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "20" ];then
                echo "Yeahmobi"
                for j in "${!SDK_Yeahmobi[@]}"; do
                    cp -a "${SDK_Path}${SDK_Yeahmobi_Path}${SDK_Yeahmobi[j]}" "${release_folder}"
                done
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "21" ];then
                echo "Appnext"
                for j in "${!SDK_Appnext[@]}"; do
                    cp -a "${SDK_Path}${SDK_Appnext_Path}${SDK_Appnext[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "22" ];then
                echo "Baidu"
                for j in "${!SDK_Baidu[@]}"; do
                    cp -a "${SDK_Path}${SDK_Baidu_Path}${SDK_Baidu[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "23" ];then
                echo "Nend"
                for j in "${!SDK_Nend[@]}"; do
                    cp -a "${SDK_Path}${SDK_Nend_Path}${SDK_Nend[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "24" ];then
                echo "Maio"
                for j in "${!SDK_Maio[@]}"; do
                    cp -a "${SDK_Path}${SDK_Maio_Path}${SDK_Maio[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "28" ];then
                echo "KS"
                for j in "${!SDK_KS[@]}"; do
                    cp -a "${SDK_Path}${SDK_KS_Path}${SDK_KS[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "29" ];then
                echo "Sigmob"
                for j in "${!SDK_Sigmob[@]}"; do
                    cp -a "${SDK_Path}${SDK_Sigmob_Path}${SDK_Sigmob[j]}" "${release_folder}"
                done
            fi
            if [ "${nwfirmid_array[i]}" -eq "36" ];then
                echo "Ogury"
                for j in "${!SDK_Ogury[@]}"; do
                    cp -a "${SDK_Path}${SDK_Ogury_Path}${SDK_Ogury[j]}" "${release_folder}"
                done
            fi
        done
        current_time=`date "+%Y%m%d%H%M%S"`
        zip -r ${sdk_release}${current_time}.zip ${release_folder}
        echo "${sdk_release}${current_time}.zip"
    fi
    
    if [ "${input_import_type}" -eq "2" ];then
        echo "${SDK_TopOn_Pod}" >> pod.txt

        for i in "${!nwfirmid_array[@]}"; do
            echo "$i=>${nwfirmid_array[i]}"
            if [ "${nwfirmid_array[i]}" -eq "1" ];then
                echo "Facebook"
                echo "${SDK_Facebook_Pod}" >> pod.txt
                echo "${SDK_Facebook_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "2" ];then
                echo "Admob"
                echo "${SDK_Admob_Pod}" >> pod.txt
                echo "${SDK_Admob_Pod1}" >> pod.txt
                echo "${SDK_Admob_Pod2}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "3" ];then
                echo "Inmobi"
                echo "${SDK_Inmobi_Pod}" >> pod.txt
                echo "${SDK_Inmobi_Pod1}" >> pod.txt

            fi
            if [ "${nwfirmid_array[i]}" -eq "4" ];then
                echo "Flurry"
                echo "${SDK_Flurry_Pod}" >> pod.txt
                echo "${SDK_Flurry_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "5" ];then
                echo "Applovin"
                echo "${SDK_Applovin_Pod}" >> pod.txt
                echo "${SDK_Applovin_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "6" ];then
                echo "Mintegral"
                echo "${SDK_Mintegral_Pod}" >> pod.txt
                echo "${SDK_Mintegral_Pod1}" >> pod.txt
                echo "${SDK_Mintegral_Pod2}" >> pod.txt
                echo "${SDK_Mintegral_Pod3}" >> pod.txt
                echo "${SDK_Mintegral_Pod4}" >> pod.txt
                echo "${SDK_Mintegral_Pod5}" >> pod.txt
                echo "${SDK_Mintegral_Pod6}" >> pod.txt
                echo "${SDK_Mintegral_Pod7}" >> pod.txt
                echo "${SDK_Mintegral_Pod8}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "7" ];then
                echo "Mopub"
                echo "${SDK_Mopub_Pod}" >> pod.txt
                echo "${SDK_Mopub_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "8" ];then
                echo "GDT"
                echo "${SDK_GDT_Pod}" >> pod.txt
                echo "${SDK_GDT_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "9" ];then
                echo "Chartboost"
                echo "${SDK_Chartboost_Pod}" >> pod.txt
                echo "${SDK_Chartboost_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "10" ];then
                echo "Tapjoy"
                echo "${SDK_Tapjoy_Pod}" >> pod.txt
                echo "${SDK_Tapjoy_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "11" ];then
                echo "Ironsource"
                echo "${SDK_IronSource_Pod}" >> pod.txt
                echo "${SDK_IronSource_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "12" ];then
                echo "UnityAds"
                echo "${SDK_UnityAds_Pod}" >> pod.txt
                echo "${SDK_UnityAds_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "13" ];then
                echo "Vungle"
                echo "${SDK_Vungle_Pod}" >> pod.txt
                echo "${SDK_Vungle_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "14" ];then
                echo "Adcolony"
                echo "${SDK_Adcolony_Pod}" >> pod.txt
                echo "${SDK_Adcolony_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "15" ];then
                echo "TouTiao"
                echo "${SDK_TT_Pod}" >> pod.txt
                echo "${SDK_TT_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "17" ];then
                echo "Oneway"
                echo "${SDK_Oneway_Pod}" >> pod.txt
                echo "${SDK_Oneway_Pod1}" >> pod.txt
                
            fi
            if [ "${nwfirmid_array[i]}" -eq "20" ];then
                echo "Yeahmobi"
                echo "${SDK_Yeahmobi_Pod}" >> pod.txt
                echo "${SDK_Yeahmobi_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "21" ];then
                echo "Appnext"
                echo "${SDK_Appnext_Pod}" >> pod.txt
                echo "${SDK_Appnext_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "22" ];then
                echo "Baidu"
                echo "${SDK_Baidu_Pod}" >> pod.txt
                echo "${SDK_Baidu_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "23" ];then
                echo "Nend"
                echo "${SDK_Nend_Pod}" >> pod.txt
                echo "${SDK_Nend_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "24" ];then
                echo "Maio"
                echo "${SDK_Maio_Pod}" >> pod.txt
                echo "${SDK_Maio_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "28" ];then
                echo "KS"
                echo "${SDK_KS_Pod}" >> pod.txt
                echo "${SDK_KS_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "29" ];then
                echo "Sigmob"
                echo "${SDK_Sigmob_Pod}" >> pod.txt
                echo "${SDK_Sigmob_Pod1}" >> pod.txt
            fi
            if [ "${nwfirmid_array[i]}" -eq "36" ];then
                echo "Ogury"
                echo "${SDK_Ogury_Pod}" >> pod.txt
                echo "${SDK_Ogury_Pod1}" >> pod.txt
            fi
        done
        current_time=`date "+%Y%m%d%H%M%S"`
        zip -r ${sdk_release}${current_time}.zip ${podDoc}
        echo "${sdk_release}${current_time}.zip"
    fi
}
ret=$(package_files)
echo "${ret}"
