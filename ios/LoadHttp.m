//
//  LoadHttp.m
//  FetchTest
//
//  Created by zhudong on 2017/6/28.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "LoadHttp.h"

@implementation LoadHttp

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(loadData:(RCTResponseSenderBlock)callback){
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"detail.txt" ofType:nil]];
    //将字典包装成数组的形式传递
    callback(@[dict]);
  });
}

@end
