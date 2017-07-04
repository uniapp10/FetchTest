//
//  Navigate.m
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "Navigate.h"
#import <UIKit/UIKit.h>
#import "ZDSecondTableController.h"

@implementation Navigate
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(push:(NSDictionary *)dict){
  
  NSLog(@"%@", dict);
  dispatch_async(dispatch_get_main_queue(), ^{
    ZDSecondTableController *secTC = [ZDSecondTableController new];
    secTC.dict = dict;
    [[self getNavigation] pushViewController:secTC animated:true];
  });
}

- (UINavigationController *)getNavigation{
  UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
  return nav;
}
@end
