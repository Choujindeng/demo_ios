//
//  UPADShowViewController.h
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const kPlacement0Name;
extern NSString *const kInmobiPlacement;
extern NSString *const kFacebookPlacement;
extern NSString *const kAdMobPlacement;
extern NSString *const kApplovinPlacement;
extern NSString *const kFlurryPlacement;
extern NSString *const kPlacement1Name;
extern NSString *const kPlacement2Name;
extern NSString *const kPlacement3Name;
@interface UPADShowViewController : UIViewController
-(instancetype) initWithPlacementName:(NSString*)name;
@end
