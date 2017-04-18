//
//  RNBroadcast.m
//  RNBroadcast
//
//  Created by uli on 3/20/17.
//  Copyright © 2017 Ulises Giacoman. All rights reserved.
//

#import "LFLivePreview.h"
#import <React/RCTViewManager.h>
#import <UIKit/UIKit.h>

@interface RNBroadcastViewManager : RCTViewManager
@end

@implementation RNBroadcastViewManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    return [[LFLivePreview alloc] initWithFrame:screen];
}
RCT_EXPORT_VIEW_PROPERTY(publish, NSString);
RCT_EXPORT_VIEW_PROPERTY(cameraPosition, NSString);

@end
