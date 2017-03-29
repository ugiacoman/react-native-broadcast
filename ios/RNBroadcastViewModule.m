//
//  RNBroadcastViewModule.m
//  RNBroadcast
//
//  Created by uli on 3/28/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTViewManager.h"
#import <React/RCTLog.h>

@interface RCT_EXTERN_MODULE(RNBroadcastViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(live, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rtmpURL, NSString)
RCT_EXPORT_VIEW_PROPERTY(cameraPosition, NSString)
@end
