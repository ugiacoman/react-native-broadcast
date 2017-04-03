
#import "LFLivePreview.h"
#import <React/RCTViewManager.h>

@interface RNBroadcastViewManager : RCTViewManager
@end

@implementation RNBroadcastViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[LFLivePreview alloc] initWithFrame:self.view.bounds];
}

@end
