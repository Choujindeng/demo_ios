//
//  ViewController.m
//  UPArpuSDKDemo
//
//  Created by Martin Lau on 04/05/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "ViewController.h"
#import "UPADShowViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, readonly) UITableView *tableView;
@property(nonatomic, readonly) NSArray<NSString*>* placementNames;
@end

static NSString *const kCellIdentifier = @"cell";
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _placementNames = @[kFlurryPlacement, kApplovinPlacement, kPlacement0Name, kInmobiPlacement, kFacebookPlacement, kAdMobPlacement, kPlacement1Name, kPlacement2Name, kPlacement3Name];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIImage *img = [UIImage imageNamed:@"video_player_mute"];
    img = nil;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_placementNames count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = _placementNames[[indexPath row]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UPADShowViewController *tVC = [[UPADShowViewController alloc] initWithPlacementName: _placementNames[[indexPath row]]];
    [self.navigationController pushViewController:tVC animated:YES];
}
@end
