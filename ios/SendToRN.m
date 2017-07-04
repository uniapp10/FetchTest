//
//  SendToRN.m
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "SendToRN.h"

@interface SendToRN ()

@end

@implementation SendToRN

+ (id)allocWithZone:(NSZone *)zone {
  static SendToRN *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}

RCT_EXPORT_MODULE();
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"RefreshEvent"];
}
- (void)refreshWithDict:(NSDictionary *)dict {
  [self sendEventWithName:@"RefreshEvent" body:dict];
}

@end
