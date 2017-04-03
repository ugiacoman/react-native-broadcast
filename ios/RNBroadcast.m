
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

@end
