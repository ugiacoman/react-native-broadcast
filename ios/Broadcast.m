//
//  Broadcast.m
//  RNBroadcast
//
//  Created by uli on 3/28/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTLog.h>
#import "Broadcast.h"

@implementation Broadcast
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}
@end

