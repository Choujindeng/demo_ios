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

input_nwfirmid_list=$1
release_folder="release_folder"
sdk_release="sdk_release_"
##根据输入的NetworkFirmId列表进行遍历，选择文件打出压缩包
package_files(){
	nwfirmid_array=(${input_nwfirmid_list//\,/ })
	rm -r ${release_folder}
	rm *.zip
	mkdir ${release_folder}

	
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
}
ret=$(package_files)
echo "${ret}"