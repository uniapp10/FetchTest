//
//  SendToRN.m
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "SendToRN.h"

@interface SendToRN ()
{
  bool hasListeners;
}
@end

@implementation SendToRN

//RCT_EXPORT_MODULE();
//+ (SendToRN *)allocWithZone:(NSZone *)zone {
//  static SendToRN *shareInstance = nil;
//  static dispatch_once_t onceToken;
//  dispatch_once(&onceToken, ^{
//    shareInstance = [self allocWithZone:zone];
//  });
//  return shareInstance;
//}
//- (NSArray<NSString *> *)supportedEvents{
//  return @[@"RefreshEvent"];
//}
//
- (void)refreshWithDict:(NSDictionary *)dict {
  [self sendEventWithName:@"RefreshEvent" body:@{@"value" : dict}];
}

RCT_EXPORT_MODULE();



// 在添加第一个监听函数时触发
-(void)startObserving {
  hasListeners = YES;
  // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
  hasListeners = NO;
  // Remove upstream listeners, stop unnecessary background tasks
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"EventReminder",@"RefreshEvent"];
}

- (void)calendarEventReminderReceived:(NSString *)str
{
//  NSString *eventName = notification.userInfo[@"name"];
  [self sendEventWithName:@"EventReminder" body:@{@"name": str}];
}

@end
