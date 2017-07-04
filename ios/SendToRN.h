//
//  SendToRN.h
//  FetchTest
//
//  Created by zhudong on 2017/6/29.
//  Copyright © 2017年 Facebook. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface SendToRN : RCTEventEmitter<RCTBridgeModule>

- (void)refreshWithDict:(NSDictionary *)dict;

@end
