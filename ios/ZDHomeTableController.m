//
//  ZDHomeTableController.m
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "ZDHomeTableController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTRootViewDelegate.h>
#import "MJRefresh.h"
#import "SendToRN.h"
#define ScreenSize [UIScreen mainScreen].bounds.size

@interface ZDHomeTableController ()<RCTRootViewDelegate>

@property (nonatomic, strong) RCTRootView *rootView;

@end

@implementation ZDHomeTableController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.tableView.tableFooterView = [UIView new];
  self.tableView.tableHeaderView = self.rootView;
  self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
}

- (void)loadData{
  [[SendToRN allocWithZone:nil] refreshWithDict:@{@"value":@"refresh"}];
  [self.tableView.mj_header endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }
  cell.textLabel.text = [NSString stringWithFormat:@"section = %zd, row = %zd",indexPath.section, indexPath.row];
    return cell;
}

#pragma mark - RCTRootViewDelegate
- (void)rootViewDidChangeIntrinsicSize:(RCTRootView *)rootView{
  CGRect frame = rootView.frame;
  CGSize intrinsicSize = rootView.intrinsicContentSize;
  frame.size = intrinsicSize;
  rootView.frame = frame;
  [self.tableView reloadData];
}
- (RCTRootView *)rootView{
  if (!_rootView) {
    NSURL *jsCodeLocation;
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"FetchTest" initialProperties:nil launchOptions:nil];
    rootView.sizeFlexibility = RCTRootViewSizeFlexibilityWidthAndHeight;
    rootView.frame = CGRectMake(0, 0, ScreenSize.width, 0);
    rootView.delegate = self;
    _rootView = rootView;
  }
  return _rootView;
}

@end
