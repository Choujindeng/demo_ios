//
//  ViewController.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "ViewController.h"

#import "UPADShowViewController.h"
#import "UPArpuRewardedVideoVideoViewController.h"
//#import "Utilities.h"
//#import "UPArpuPlacementSettingManager.h"
//#import "UPArpuAPI.h"
//#import "UPArpuVideoView.h"
//#import "UPArpuRewardedVideoVideoViewController.h"

@import UpArpuSDK;
@import UpArpuRewardedVideo;
#import <VungleSDK/VungleSDK.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
    @property(nonatomic, readonly) UITableView *tableView;
    @property(nonatomic, readonly) NSArray<NSArray<NSString*>*>* placementNames;
    @end

static NSString *const kCellIdentifier = @"cell";
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController viewDidLoad");
    _placementNames = @[@[kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMopubPlacementName, kTapjoyPlacementName, kChartboostPlacementName, kIronsourcePlacementName, kVunglePlacementName, kAdcolonyPlacementName, kUnityAdsPlacementName, kAllPlacementName],
                        @[kFacebookPlacement, kAdMobPlacement, kInmobiPlacement, kFlurryPlacement, kApplovinPlacement, kMintegralPlacement, kMopubPlacementName, kAllPlacementName]];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    NSLog(@"ViewController _placementNames init");
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"GDPR" style:UIBarButtonItemStylePlain target:self action:@selector(policyButtonTapped)];
    self.navigationItem.rightBarButtonItem = item;
}
    
-(void)policyButtonTapped {
    [[UPArpuAPI sharedInstance] presentDataConsentDialogInViewController:self];
    NSLog(@"ViewController policyButtonTapped");
}
    
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"ViewController numberOfSectionsInTableView");
    return 2;
}
    
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"ViewController numberOfRowsInSection");
    return [_placementNames[section] count];
}
    
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ViewController heightForRowAtIndexPath");
    return 50.0f;
}
    
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
     NSLog(@"ViewController heightForHeaderInSection");
    return 25.0f;
}
    
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"ViewController titleForHeaderInSection %ld", section);
    return @[@"RV", @"Native"][section];
}
    
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = _placementNames[[indexPath section]][[indexPath row]];
    NSLog(@"ViewController cellForRowAtIndexPath %ld %ld", [indexPath section], [indexPath row]);
    return cell;
}
    
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"ViewController didSelectRowAtIndexPath");
    if ([indexPath section] == 0) {
        UPArpuRewardedVideoVideoViewController *tVC = [[UPArpuRewardedVideoVideoViewController alloc] initWithPlacementName:_placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    } else if ([indexPath section] == 1) {
        UPADShowViewController *tVC = [[UPADShowViewController alloc] initWithPlacementName: _placementNames[[indexPath section]][[indexPath row]]];
        [self.navigationController pushViewController:tVC animated:YES];
    }
}
    @end
