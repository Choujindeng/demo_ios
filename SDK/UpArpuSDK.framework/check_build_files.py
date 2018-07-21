#!/usr/bin/env python
# -*- coding:utf-8 -*-

import argparse
import subprocess
import requests
import os

#执行流程说明：
#1、xcodebuild执行生成指定的target
#2、copy target到指定目录
#3、copy文档到指定目录
#4、打成zip包

#configuration for iOS build setting
UPARPU_VERSION = "2.0.0"
CONFIGURATION = "Release"
EXPORT_OPTIONS_PLIST = "exportOptions.plist"
#保存发布包的路径
EXPORT_RELEASE_DIRECTORY = "../release/"
#保存framework的路径
EXPORT_RELEASE_FRAMEWORKS_DIRECTORY = "../release/frameworks_tmp/"
#target list
EXPORT_TARGETS_LIST = ['UpArpuSDK'
                       ,'UpArpuNative'
                       ,'UpArpuRewardedVideo'
                       ,'UpArpuAdmobNativeAdapter'
                       ,'UpArpuApplovinNativeAdapter'
                       ,'UpArpuFacebookNativeAdapter'
                       ,'UpArpuFlurryNativeAdapter'
                       ,'UpArpuMopubNativeAdapter'
                       ,'UpArpuMintegralNativeAdapter'
                       ,'UpArpuInmobiNativeAdapter'
                       ,'UpArpuAdmobRewardedVideoAdapter'
                       ,'UpArpuApplovinRewardedVideoAdapter'
                       ,'UpArpuAdColonyRewardedVideoAdapter'
                       ,'UpArpuChartboostRewardedVideoAdapter'
                       ,'UpArpuFacebookRewardedVideoAdapter'
                       ,'UpArpuFlurryRewardedVideoAdapter'
                       ,'UpArpuInmobiRewardedVideoAdapter'
                       ,'UpArpuIronSourceRewardedVideoAdapter'
                       ,'UpArpuMintegralRewardedVideoAdapter'
                       ,'UpArpuMopubRewardedVideoAdapter'
                       ,'UpArpuTapjoyRewardedVideoAdapter'
                       ,'UpArpuUnityAdsRewardedVideoAdapter'
                       ,'UpArpuVungleRewardedVideoAdapter']
#EXPORT_TARGETS_LIST = ['UpArpuSDK']

#CPU支持指令集架构
#EXPORT_ARCH_LIST = ['armv7','armv7s','arm64','x86_64']
EXPORT_OS_ARCH_LIST = ['armv7','armv7s','arm64']
EXPORT_SIMULATOR_ARCH_LIST = ['i386','x86_64']

#mergeframeworks
def checkArchFrameworks():
    
    export_os_frameworkds_dir = EXPORT_RELEASE_FRAMEWORKS_DIRECTORY + "os/"
    export_simulator_frameworkds_dir = EXPORT_RELEASE_FRAMEWORKS_DIRECTORY + "simulator/"
    export_merge_frameworkds_dir = EXPORT_RELEASE_FRAMEWORKS_DIRECTORY + "merge/"
    
    #lipo merge target
    for target in EXPORT_TARGETS_LIST:
        #info arch
        exportCmd = "lipo -info " + export_merge_frameworkds_dir + target + ".framework/" + target
        process = subprocess.Popen(exportCmd, shell = True)
        process.wait()


def main():
    checkArchFrameworks()


if __name__ == '__main__':
    main()

