//
//  WMPlayerItem.h
//  WMAdSDK
//
//  Created by hlw on 2017/12/21.
//  Copyright © 2017年 bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMPlayerItem : NSObject

/**
 * 视频标题
 */
@property (nonatomic, copy) NSString *title;

/**
 * 视频URL
 */
@property (nonatomic, strong) NSURL *videoURL;

/**
 * 视频封面本地图片
 */
@property (nonatomic, strong) UIImage *placeholderImage;

/**
 * 视频封面网络图片url
 * 如果和本地图片同时设置，则忽略本地图片，显示网络图片
 */
@property (nonatomic, copy) NSString *placeholderImageURLString;

/**
 * 从xx秒开始播放视频(默认0)
 */
@property (nonatomic, assign) NSInteger seekTime;

@end
