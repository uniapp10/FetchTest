//
//  Navigate.m
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "Navigate.h"
#import <UIKit/UIKit.h>

@implementation Navigate
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(push:(NSDictionary *)dict){
  NSLog(@"%@", dict);
  
}

- (UINavigationController *)getNavigation{
  UINavigationController *nav = [UIApplication sharedApplication].keyWindow.rootViewController;
  return nav;
}
@end
