## [IMPORTANT] DO NOT expose any of the frameworks to Windows operating system; Windows modifies frameworks, making them incomplete and resulting in compile errors.
## 【重要】请勿将iOS需要用到的SDK（包括.a、.framework及.embededframework格式的套件）下载或传送至Windows操作系统上，因为Windows文件系统会修改这些SDK，导致它们在Xcode中无法编译。
# AnythinkSDK_iOS_SDK_5.5.1
## Third-party SDK version for AnyThink_ios_sdk_5.5.1

[Integrate Guide for AnyThinkSDK for iOS(English)](iOS_Doc_EN/iOS_Integration_Guide.md)

[Error Code And FAQ(English)](iOS_Doc_EN/Error_Code_and_FAQ.md)

[AnyThinkSDK for iOS 中文集成文档](iOS_Doc_CHN/iOS_Integration_Guide.md)

[Error Code And FAQ 中文版](iOS_Doc_CHN/Error_Code_and_FAQ.md)

<br>
(建议从这里的链接下载,git的download zip会出现文件损坏的问题，导致无法编译)下载地址（download）：<br>
1.  TopOn iOS SDK v5.4.5 (包括三方广告平台SDK) <br>
http://sdk-release.toponad.com/iOS/5.4.5/TopOniOSv5.4.5.zip  <br>
2. TopOn Unity SDK for iOS <br>
http://sdk-release.toponad.com/Unity/5.4.4/Unity_iOSv5.4.4.unitypackage <br>
3. TopOn Unity SDK for iOS & Android <br>
http://sdk-release.toponad.com/Unity/5.4.4/Unity_v5.4.4_Android_iOS_.unitypackage <br>



| Network | SDK Version | note |
|---|---|---|
| Facebook | 5.5.1 |FBAudienceNetwork.framework 版本为5.5.1<br>FBSDKCoewKit.framework版本为5.5.0|
| Admob | 7.52.0 ||
| Inmobi | 7.3.1 ||
| Flurry | 9.0.0 ||
| Applovin | 6.11.4 ||
| Mintegral | 5.8.7 ||
| Mopub | 5.10.0 ||
| GDT | 4.11.5 |广点通/Tencent/腾讯广告|
| Yeahmobi | 3.2.0 ||
| Appnext | 1.9.3 ||
| Chartboost | 8.0.3 ||
| Ironsource | 6.10.0 ||
| Vungle | 6.4.6 ||
| Adcolony | 4.1.2.0 ||
| UnityAds | 3.4.0 ||
| TiTok | 2.7.5.2 |头条/穿山甲/TiTok|
| Tapjoy | 12.3.4 ||
| Oneway | 2.1.0 ||
| Baidu | 4.67 ||
| MobPower | 1.0.0 ||
| Nend | 5.3.1 ||
| Maio | 1.5.0 ||
| ks | 2.5.2.21 |需要额外导入第三方依赖：<br> AFNetworking/Godzippa/MJExtension/SDWebImage|
| sigmob | 2.15.2 |sdk：WindSDK.framework <br>sigmob.bundle|
| Ogury | 1.0.3 |OguryOED_1.0.3 包含以下sdk<br>OMSDK_Oguryco.framework<br>OguryAds.framework<br>OguryConsentManager.framework|


## AnyThink network_name and network_firm_id mapping

| Network Name| NETWORK FIRM ID|
|---|---|
|Facebook | 1 |
|Admob | 2 |
|Inmobi | 3 | 
|Flurry| 4 | 
|Applovin| 5 | 
|Mintegral | 6 |
|Mopub | 7 |
|GDT | 8|
|Chartboost | 9| 
|Tapjoy | 10 |
|Ironsource | 11|
|UnityAds | 12 |
|Vungle | 13 | 
|Adcolony | 14 | 
|TiTok|15|
|玩转互联 | 16 |
|Oneway|17|
|MobPower | 18 |
|金山云 | 19 |
|Yeahmobi|20|
|Appnext|21|
|Baidu|22|
|Nend|23|
|Maio|24|
|KS|28|
|Sigmob|29|
|Ogury|36|

