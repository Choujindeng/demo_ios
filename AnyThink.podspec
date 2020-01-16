Pod::Spec.new do |spec|
  spec.name         = "AnyThinkiOS"
  spec.version      = "1.0.0"
  spec.summary      = "A short description of AnyThink SDK for iOS."
  spec.description  = <<-DESC
			TopOn SDK for developer
                   DESC
  spec.homepage     = "https://github.com/anythinkteam/demo_ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "topon" => "developer@toponad.com" }
  spec.source       = { :git => "https://github.com/anythinkteam/demo_ios.git", :tag => spec.version }
  spec.platform     = :ios, '8.0'
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true
  spec.frameworks = 'SystemConfiguration', 'CoreGraphics','Foundation','UIKit','AdSupport','StoreKit','QuartzCore','CoreTelephony','MobileCoreServices','Accelerate','AVFoundation','WebKit','VideoToolbox'
  spec.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}
  spec.libraries = 'c++', 'z', 'sqlite3', 'xml2'
  
  spec.default_subspecs = 'AnyThinkSDK'

  spec.subspec 'AnyThinkSDK' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThink{Banner,Splash,SDK,RewardedVideo,Interstitial,HeaderBidding,Native}.framework'
     ss.resource = 'AnyThinkSDKDemo/SDK/AnyThinkSDK.bundle'
  end

  spec.subspec 'AnyThinkTTAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkTT*.framework'
     ss.dependency 'AnyThink/AnyThinkSDK'
  end
  
  spec.subspec 'AnyThinkFacebookAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkFacebook*.framework'
  end
  
  spec.subspec 'AnyThinkAdmobAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkAdmob*.framework'
  end
  
  spec.subspec 'AnyThinkInmobiAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkInmobi*.framework'
  end
  
  spec.subspec 'AnyThinkFlurryAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkFlurry*.framework'
  end
  
  spec.subspec 'AnyThinkApplovinAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkApplovin*.framework'
  end
  
  spec.subspec 'AnyThinkMintegralAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkMintegral*.framework'
  end
  
  spec.subspec 'AnyThinkMopubAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkMopub*.framework'
  end
  
  spec.subspec 'AnyThinkGDTAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkGDT*.framework'
  end
  spec.subspec 'AnyThinkYeahmobiAdapter' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.dependency 'AnyThink/AnyThinkSDK'
    ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkYeahmobi*.framework'
  end
  
  spec.subspec 'AnyThinkAppnextAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkAppnext*.framework'
  end
  
  spec.subspec 'AnyThinkChartboostAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkChartboost*.framework'
  end
  
  spec.subspec 'AnyThinkIronSourceAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkIronSource*.framework'
  end
  
  spec.subspec 'AnyThinkVungleAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkVungle*.framework'
  end
  
  spec.subspec 'AnyThinkAdcolonyAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkAdColony*.framework'
  end
  
  spec.subspec 'AnyThinkUnityAdsAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkUnityAds*.framework'
  end
  
  spec.subspec 'AnyThinkTapjoyAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkTapjoy*.framework'
  end
  
  spec.subspec 'AnyThinkOnewayAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkOneway*.framework'
  end
  
  spec.subspec 'AnyThinkBaiduAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkBaidu*.framework'
  end
  
  #spec.subspec 'AnyThinkMobPowerAdapter' do |ss|
  #   ss.ios.deployment_target = '8.0'
  #   ss.dependency 'AnyThink/AnyThinkSDK'
  #   ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkMobPower*.framework'
  #end
  
  spec.subspec 'AnyThinkNendAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkNend*.framework'
  end
  
  spec.subspec 'AnyThinkMaioAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkMaio*.framework'
  end
  
  spec.subspec 'AnyThinkKSAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkKS*.framework'
  end
  
  spec.subspec 'AnyThinkSigmobAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkSigmob*.framework'
  end
  
  spec.subspec 'AnyThinkOguryAdapter' do |ss|
     ss.ios.deployment_target = '8.0'
     ss.dependency 'AnyThink/AnyThinkSDK'
     ss.vendored_frameworks = 'AnyThinkSDKDemo/SDK/AnyThinkOgury*.framework'
  end

end
